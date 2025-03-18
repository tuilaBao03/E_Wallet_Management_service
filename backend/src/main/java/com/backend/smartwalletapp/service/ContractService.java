package com.backend.smartwalletapp.service;

import java.util.List;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Service;

import com.backend.smartwalletapp.Mapper.ContractMapper;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Result;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractByNumberV2Result;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractsByClientV2Result;
import com.backend.smartwalletapp.client.responses.Contract.get.IssContractDetailsAPIOutputV2Record;
import com.backend.smartwalletapp.client.service.ContractSoapService;
import com.backend.smartwalletapp.config.ApplicationInitConfig;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequestLevel2;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.Contract;
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

    private final ApplicationRunner applicationRunner;

    private final ApplicationInitConfig applicationInitConfig;



    ContractSoapService contractSoapService;
    ContractMapper contractMapper;





    // public Contract LockUnlockContract(String id,LockUnLockContracRequest request){
    //     try {
    //         LockOrUnLockContractSoapResponse lockOrUnlockCardHolderSoapResponse 
    //         = contractSoapService.LockOrUnLockContractSoap(id, request.isNewStatus());
            
    //         return lockOrUnlockCardHolderSoapResponse.getContract();
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new AppException(ErrorCode.LOCK_UNLOCK_FAILE);
    //     }
    // }

    // public List<Contract> giveContractByCardHolder(String cardHolderId){
    //     try {
    //         GetContractByCardHolderSoapResponse getContractByCardHolderSoapResponse
    //         = contractSoapService.getContractByCardHolder(cardHolderId);
    //         return getContractByCardHolderSoapResponse.getContracts();
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
    //     }
    // }
    
    // public ContractResponse giveContractBySearch(String search, int page){
    //     try {
    //         GetContractBySearchSoapResponse getContractBySearchSoapResponse
    //         = contractSoapService.getContractBySearch(search, page);
    //         List<Contract> contracts = getContractBySearchSoapResponse.getContracts();
    //         int pages = getContractBySearchSoapResponse.getPage();
    //         int pageAmount = getContractBySearchSoapResponse.getPageAmount();

    //         ContractResponse contractResponse = new ContractResponse(pages, pageAmount,contracts);
    //         return contractResponse;
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
    //     }
    // }
    // public Contract updateLimit(String contractId, BigDecimal newLimit){
    //     try {
    //         UpdateLimitContractSoapResponse updateLimitContractSoapResponse
    //         = contractSoapService.UpdateLimitContractByCardHolder(contractId, newLimit);
    //         Contract contract = updateLimitContractSoapResponse.getContract();
    //         return contract;
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
    //     }
    // }
    public CreateContractReponse createContract(ContractCreatedRequest request){
        try {
            CreateContractV4_REQ req = contractMapper.mapToSoapRequest(request);
            CreateContractV4Result createContractV4Result = contractSoapService.createContract(req);
            CreateContractReponse createContractReponse = contractMapper.toContractReponse(createContractV4Result);
            return createContractReponse;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }

    public CreateContractReponse createContractV2(ContractCreatedRequestLevel2 request){
        try {
            CreateContractV4_REQV2 req = contractMapper.mapToSoapRequestV2(request);
            CreateContractV4Result createContractV4Result = contractSoapService.createContractLevel2(req);
            CreateContractReponse createContractReponse = contractMapper.toContractReponse(createContractV4Result);
            return createContractReponse;
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
            System.err.println("___________________________");
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
    public ApiResponse<List<IssContractDetailsAPIOutputV2Record>> GetContracts_ClientIdentifier(String ClientIdentifier){
        try{
            GetContractsByClientV2Result response = contractSoapService.getContractByClientIdentifier(ClientIdentifier);
            int code = response.getRetCode();
            String mess = response.getResultInfo();

            List<IssContractDetailsAPIOutputV2Record> contract = response.getOutObject().getContractRecords();



            return ApiResponse.<List<IssContractDetailsAPIOutputV2Record>>builder()
            .result(contract)
            .code(code)
            .message(mess).build();
        }
        catch(Exception e){
            System.err.println("\n____________ 06112003_______________\n");
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }

}
