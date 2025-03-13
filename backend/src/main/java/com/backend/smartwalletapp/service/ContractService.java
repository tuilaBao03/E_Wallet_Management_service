package com.backend.smartwalletapp.service;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.smartwalletapp.Mapper.ContractMapper;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.responses.Contract.GetContractByCardHolderSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.GetContractBySearchSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.LockOrUnLockContractSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.UpdateLimitContractSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Result;
import com.backend.smartwalletapp.client.service.ContractSoapService;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequestLevel2;
import com.backend.smartwalletapp.dto.request.Contract.LockUnLockContracRequest;
import com.backend.smartwalletapp.dto.response.Contract.ContractResponse;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;

import com.backend.smartwalletapp.model.Contract;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractService {
    ContractSoapService contractSoapService;
    ContractMapper contractMapper;
    public Contract LockUnlockContract(String id,LockUnLockContracRequest request){
        try {
            LockOrUnLockContractSoapResponse lockOrUnlockCardHolderSoapResponse 
            = contractSoapService.LockOrUnLockContractSoap(id, request.isNewStatus());
            
            return lockOrUnlockCardHolderSoapResponse.getContract();
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.LOCK_UNLOCK_FAILE);
        }
    }

    public List<Contract> giveContractByCardHolder(String cardHolderId){
        try {
            GetContractByCardHolderSoapResponse getContractByCardHolderSoapResponse
            = contractSoapService.getContractByCardHolder(cardHolderId);
            return getContractByCardHolderSoapResponse.getContracts();
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
    
    public ContractResponse giveContractBySearch(String search, int page){
        try {
            GetContractBySearchSoapResponse getContractBySearchSoapResponse
            = contractSoapService.getContractBySearch(search, page);
            List<Contract> contracts = getContractBySearchSoapResponse.getContracts();
            int pages = getContractBySearchSoapResponse.getPage();
            int pageAmount = getContractBySearchSoapResponse.getPageAmount();

            ContractResponse contractResponse = new ContractResponse(pages, pageAmount,contracts);
            return contractResponse;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
    public Contract updateLimit(String contractId, BigDecimal newLimit){
        try {
            UpdateLimitContractSoapResponse updateLimitContractSoapResponse
            = contractSoapService.UpdateLimitContractByCardHolder(contractId, newLimit);
            Contract contract = updateLimitContractSoapResponse.getContract();
            return contract;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
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
            e.printStackTrace();
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }

}
