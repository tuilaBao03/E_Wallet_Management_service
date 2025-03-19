package com.backend.smartwalletapp.Mapper;


import java.util.List;

import org.mapstruct.Mapper;

import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.InObject;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractInObject;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Result;
import com.backend.smartwalletapp.client.responses.Contract.get.IssContractDetailsAPIOutputV2Record;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequestLevel2;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.Contract;

@Mapper(componentModel = "spring")
public interface ContractMapper {

    CreateContractReponse toContractReponse(CreateContractV4Result response);

    Contract toContract(IssContractDetailsAPIOutputV2Record reponse);
    List<Contract> toContractList(List<IssContractDetailsAPIOutputV2Record> list);

    default CreateContractV4_REQ mapToSoapRequest(ContractCreatedRequest dto) {
        CreateContractV4_REQ request = new CreateContractV4_REQ();

        request.setClientSearchMethod(dto.getClientSearchMethod());
        request.setClientIdentifier(dto.getClientIdentifier());
        request.setReason(dto.getReason());
        request.setSetCustomDataInObject(dto.getCustomData());

        CreateContractInObject contractInObject = new CreateContractInObject();
        contractInObject.setBranch(dto.getBranch());
        contractInObject.setInstitutionCode(dto.getInstitutionCode());
        contractInObject.setProductCode(dto.getProductCode());
        contractInObject.setProductCode2(dto.getProductCode2());
        contractInObject.setProductCode3(dto.getProductCode3());
        contractInObject.setContractName(dto.getContractName());
        contractInObject.setCbsNumber(dto.getCbsNumber());
        request.setCreateContractInObject(contractInObject);

    

        return request;
    }

    default CreateContractV4_REQV2 mapToSoapRequestV2(ContractCreatedRequestLevel2 dto) {
        CreateContractV4_REQV2 request = new CreateContractV4_REQV2();

        request.setLiabCategory(dto.getLiabCategory());
        request.setLiabContractSearchMethod(dto.getLiabContractSearchMethod());
        request.setLiabContractIdentifier(dto.getLiabContractIdentifier());
        request.setClientSearchMethod(dto.getClientSearchMethod());
        request.setClientIdentifier(dto.getClientIdentifier());
        request.setProductCode(dto.getProductCode());
        request.setProductCode2(dto.getProductCode2());
        request.setProductCode3(dto.getProductCode3());
        
        InObject inObject = new InObject();
        inObject.setBranch(dto.getBranch());
        inObject.setInstitutionCode(dto.getInstitutionCode());
        inObject.setContractName(dto.getContractName());
        inObject.setCbsNumber(dto.getCbsNumber());
        inObject.setAddInfo01(dto.getAddInfo01());
        inObject.setAddInfo02(dto.getAddInfo02()); 
        request.setInObject(inObject);

        return request;
    }

    

    

    
}
