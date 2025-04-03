package com.backend.smartwalletapp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Service;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.requests.Contract.Edit.EditContractV4;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Result;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractByNumberV2Result;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractsByClientV2Result;
import com.backend.smartwalletapp.client.responses.Contract.get.IssContractDetailsAPIOutputV2Record;
import com.backend.smartwalletapp.client.service.ContractSoapService;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequestLevel2;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.ContractBySearchAndPage;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.ContractListResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractService {
    ContractSoapService contractSoapService;
    CardHolderService cardHolderService;
    public List<ContractListResponse> giveContractBySearchAndPage(String search, int page, int count ) {
    
        String query = """
            SELECT CONTRACT_NUMBER, BRANCH, SERVICE_GROUP, CONTRACT_NAME, CONTRACT_LEVEL, 
                BILLING_CONTRACT, PARENT_PRODUCT, PRODUCT, LIAB_CONTRACT 
            FROM ACNT_CONTRACT ORDER BY id DESC
        """;

        try (Connection connection = cardHolderService.openConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery()) {

            List<ContractBySearchAndPage> allContracts = new ArrayList<>();

            while (resultSet.next()) {
                ContractBySearchAndPage contract = new ContractBySearchAndPage();
                contract.setContractNumber(resultSet.getString("CONTRACT_NUMBER"));
                contract.setBranch(resultSet.getString("BRANCH"));
                contract.setSERVICE_GROUP(resultSet.getString("SERVICE_GROUP"));
                contract.setContractName(resultSet.getString("CONTRACT_NAME"));
                contract.setContractLevel(resultSet.getString("CONTRACT_LEVEL"));
                contract.setBillingContract(resultSet.getString("BILLING_CONTRACT"));
                contract.setParentProduct(resultSet.getString("PARENT_PRODUCT"));
                contract.setProductCode(resultSet.getString("PRODUCT"));
                contract.setLiabilityContract(resultSet.getString("LIAB_CONTRACT"));
                allContracts.add(contract);
            }

            // Chia danh sách theo CONTRACT_LEVEL
            List<ContractBySearchAndPage> libContracts = allContracts.stream()
                    .filter(c -> ".".equals(c.getContractLevel()))
                    .toList();

            List<ContractBySearchAndPage> issueContracts = allContracts.stream()
                    .filter(c -> c.getContractLevel() != null && c.getContractLevel().matches("^\\.[0-9]+\\.$"))
                    .toList();

            List<ContractBySearchAndPage> cardContracts = allContracts.stream()
                    .filter(c -> c.getContractLevel() == null || !c.getContractLevel().matches("^\\.[0-9]+\\.$"))
                    .toList();

            // Gán danh sách cards cho issueContracts
            issueContracts.forEach(issue -> issue.setContract(
                    cardContracts.stream()
                            .filter(card -> card.getParentProduct() != null && card.getParentProduct().equals(issue.getProductCode()))
                            .toList()
            ));

            // Gán danh sách issueContracts cho libContracts
            libContracts.forEach(lib -> lib.setContract(
                    issueContracts.stream()
                            .filter(issue -> issue.getLiabilityContract() != null && issue.getLiabilityContract().equals(lib.getBillingContract()))
                            .toList()
            ));

            // Lọc danh sách theo search
            List<ContractBySearchAndPage> searchAndPages = libContracts.stream()
                    .filter(c -> c.getContractName().toLowerCase().contains(search.toLowerCase()))
                    .toList();

            // ✅ Áp dụng phân trang
            int pageSize = count;
            int totalRecords = searchAndPages.size();
            int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
            int fromIndex = (page - 1) * pageSize;
            int toIndex = Math.min(fromIndex + pageSize, totalRecords);

            List<ContractBySearchAndPage> paginatedContracts = new ArrayList<>();
            if (fromIndex < totalRecords) {
                paginatedContracts = searchAndPages.subList(fromIndex, toIndex);
            }

            // Tạo danh sách trả về
            List<ContractListResponse> responseList = new ArrayList<>();
            ContractListResponse response = new ContractListResponse();
            response.setPage(page);
            response.setPageTotal(totalPages);
            response.setContracts(paginatedContracts);
            responseList.add(response);

            return responseList;

        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }

    public CreateContractV4Result createContract(CreateContractV4_REQ request){
        try {
            CreateContractV4Result createContractV4Result = contractSoapService.createContract(request);
            return createContractV4Result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }

    public CreateContractV4Result createContractV2(CreateContractV4_REQV2 request){
        try {
            CreateContractV4Result createContractV4Result = contractSoapService.createContractLevel2(request);
            return createContractV4Result;
        } catch (Exception e) {
            System.err.println("___________________________");
            e.printStackTrace();
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }
    public ApiResponse<List<IssContractDetailsAPIOutputV2Record>> GetContracts_ContractNumber(String contractNumber){
        try{
            GetContractByNumberV2Result response = contractSoapService.getContractByContractNumber(contractNumber);
            int code = response.getRetCode();
            String mess = response.getResultInfo();
            List<IssContractDetailsAPIOutputV2Record> contract = response.getOutObject().getContractRecords();

            return ApiResponse.<List<IssContractDetailsAPIOutputV2Record>>builder()
            .result(contract)
            .code(code)
            .message(mess).build();
        }
        catch(Exception e){
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
    public ApiResponse<List<IssContractDetailsAPIOutputV2Record>> GetContracts_ClientIdentifier(String ClientIdentifier) {
        try {
            // Gọi SOAP API để lấy danh sách hợp đồng
            GetContractsByClientV2Result response = contractSoapService.getContractByClientIdentifier(ClientIdentifier);
            int code = response.getRetCode();
            String mess = response.getResultInfo();
            
            if(response.getOutObject() == null || response.getOutObject().getContractRecords() == null){
                return ApiResponse.<List<IssContractDetailsAPIOutputV2Record>>builder()
                    .result(Collections.emptyList())
                    .code(code)
                    .message(mess)
                    .build();
            }
            else{
            List<IssContractDetailsAPIOutputV2Record> allContracts = response.getOutObject().getContractRecords();
                // Phân loại hợp đồng
            List<IssContractDetailsAPIOutputV2Record> libContracts = allContracts.stream()
            .filter(c -> ".".equals(c.getContractLevel()))
            .toList();

            List<IssContractDetailsAPIOutputV2Record> issueContracts = allContracts.stream()
                    .filter(c -> c.getContractLevel() != null && c.getContractLevel().matches("^\\.[0-9]+\\.$"))
                    .toList();

            List<IssContractDetailsAPIOutputV2Record> cardContracts = allContracts.stream()
                    .filter(c -> c.getContractLevel() == null || !c.getContractLevel().matches("^\\.[0-9]+\\.$"))
                    .toList();

            // Gán danh sách cardContracts cho issueContracts
            issueContracts.forEach(issue -> issue.setContract(
                    cardContracts.stream()
                            .filter(card -> card.getParentProduct() != null && card.getParentProduct().equals(issue.getProduct()))
                            .toList()
            ));

            // Gán danh sách issueContracts cho libContracts
            libContracts.forEach(lib -> lib.setContract(
                    issueContracts.stream()
                            .filter(issue -> issue.getLiabilityContract()!= null && issue.getLiabilityContract().equals(lib.getBillingContract()))
                            .toList()
            ));
            return ApiResponse.<List<IssContractDetailsAPIOutputV2Record>>builder()
                    .result(libContracts)
                    .code(code)
                    .message(mess)
                    .build();

            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
}


//     public List<ContractBySearchAndPage> giveContractBySearchAndPage(String search, int page) {
    
//     String query = """
//         SELECT CONTRACT_NUMBER, BRANCH, SERVICE_GROUP, CONTRACT_NAME, CONTRACT_LEVEL, 
//                BILLING_CONTRACT, PARENT_PRODUCT, PRODUCT, LIAB_CONTRACT 
//         FROM ACNT_CONTRACT
//     """;

//     try (Connection connection = cardHolderService.openConnection();
//          PreparedStatement statement = connection.prepareStatement(query);
//          ResultSet resultSet = statement.executeQuery()) {

//         List<ContractBySearchAndPage> allContracts = new ArrayList<>();

//         while (resultSet.next()) {
//             ContractBySearchAndPage contract = new ContractBySearchAndPage();
//             contract.setCONTRACT_NUMBER(resultSet.getString("CONTRACT_NUMBER"));
//             contract.setBRANCH(resultSet.getString("BRANCH"));
//             contract.setSERVICE_GROUP(resultSet.getString("SERVICE_GROUP"));
//             contract.setCONTRACT_NAME(resultSet.getString("CONTRACT_NAME"));
//             contract.setCONTRACT_LEVEL(resultSet.getString("CONTRACT_LEVEL"));
//             contract.setBILLING_CONTRACT(resultSet.getString("BILLING_CONTRACT"));
//             contract.setPARENT_PRODUCT(resultSet.getString("PARENT_PRODUCT"));
//             contract.setPRODUCT(resultSet.getString("PRODUCT"));
//             contract.setLIAB_CONTRACT(resultSet.getString("LIAB_CONTRACT"));
//             allContracts.add(contract);
//         }

//         // Chia danh sách bằng Stream API
//         List<ContractBySearchAndPage> libContracts = allContracts.stream()
//                 .filter(c -> ".".equals(c.getCONTRACT_LEVEL()))
//                 .toList();

//         List<ContractBySearchAndPage> issueContracts = allContracts.stream()
//                 .filter(c -> c.getCONTRACT_LEVEL() != null && c.getCONTRACT_LEVEL().matches("^\\.[0-9]+\\.$"))
//                 .toList();

//         List<ContractBySearchAndPage> cardContracts = allContracts.stream()
//                 .filter(c -> c.getCONTRACT_LEVEL() == null || !c.getCONTRACT_LEVEL().matches("^\\.[0-9]+\\.$"))
//                 .toList();

//         // Gán danh sách cards cho issueContracts
//         issueContracts.forEach(issue -> issue.setContracts(
//                 cardContracts.stream()
//                         .filter(card -> card.getPARENT_PRODUCT() != null && card.getPARENT_PRODUCT().equals(issue.getPRODUCT()))
//                         .toList()
//         ));

//         // Gán danh sách issueContracts cho libContracts
//         libContracts.forEach(lib -> lib.setContracts(
//                 issueContracts.stream()
//                         .filter(issue -> issue.getLIAB_CONTRACT() != null && issue.getLIAB_CONTRACT().equals(lib.getBILLING_CONTRACT()))
//                         .toList()
//         ));

//         List<ContractBySearchAndPage> searchAndPages = new ArrayList<>();

//         for(int i=0;i<libContracts.size();i++){
//             if (libContracts.get(i).getCONTRACT_NAME().toLowerCase().contains(search.toLowerCase())) {
//                 searchAndPages.add(libContracts.get(i));
//             }
//         }

        
        

//         return libContracts;

//     } catch (Exception e) {
//         e.printStackTrace();
//         throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
//     }
// }
