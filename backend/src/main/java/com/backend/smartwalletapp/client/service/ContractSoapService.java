package com.backend.smartwalletapp.client.service;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;

import com.backend.smartwalletapp.client.requests.CardHolders.UpdateLimitContractSoapRequest;
import com.backend.smartwalletapp.client.requests.Contract.GetContractByCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.Contract.GetContractBysearchSoapRequest;
import com.backend.smartwalletapp.client.requests.Contract.LockOrUnlockContractSoapRequest;
import com.backend.smartwalletapp.client.responses.Contract.GetContractByCardHolderSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.GetContractBySearchSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.LockOrUnLockContractSoapResponse;
import com.backend.smartwalletapp.client.responses.Contract.UpdateLimitContractSoapResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;

import jakarta.xml.bind.JAXBElement;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ContractSoapService {
    private final WebServiceTemplate webServiceTemplate;

    StringBuilder soapUrl = new StringBuilder("http://example.com/soap-api/contracts");
    @SuppressWarnings("unchecked")
    public GetContractBySearchSoapResponse getContractBySearch(String search, int page) {
        // method implementation
        String fullString = soapUrl.toString();
        GetContractBysearchSoapRequest request = new GetContractBysearchSoapRequest(search,page);
        try {
            JAXBElement<GetContractBySearchSoapResponse> response =
            (JAXBElement<GetContractBySearchSoapResponse>)
            webServiceTemplate.marshalSendAndReceive(fullString, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }


    }
    @SuppressWarnings("unchecked")
    public GetContractByCardHolderSoapResponse getContractByCardHolder(String cardHolderId) {
        // method implementation
        String fullString = soapUrl + "/cardHolder";
        GetContractByCardHolderSoapRequest request = new GetContractByCardHolderSoapRequest(cardHolderId);
        try {
            JAXBElement<GetContractByCardHolderSoapResponse> response =
            (JAXBElement<GetContractByCardHolderSoapResponse>)
            webServiceTemplate.marshalSendAndReceive(fullString, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }

    @SuppressWarnings("unchecked")
    public UpdateLimitContractSoapResponse UpdateLimitContractByCardHolder(String contractId, BigDecimal limit) {
        // method implementation
        String fullString = soapUrl + "/cardHolder";
        UpdateLimitContractSoapRequest request = new UpdateLimitContractSoapRequest(contractId,limit);
        try {
            JAXBElement<UpdateLimitContractSoapResponse> response =
            (JAXBElement<UpdateLimitContractSoapResponse>)
            webServiceTemplate.marshalSendAndReceive(fullString, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.UPDATE_CONTRACT_FAILE);
        }
    }

    @SuppressWarnings("unchecked")
    public LockOrUnLockContractSoapResponse LockOrUnLockContractSoap(String contractId, boolean newstatus) {
        // method implementation
        String fullString = soapUrl + "/cardHolder";
        LockOrUnlockContractSoapRequest request = new LockOrUnlockContractSoapRequest(contractId, newstatus);
        try {
            JAXBElement<LockOrUnLockContractSoapResponse> response =
            (JAXBElement<LockOrUnLockContractSoapResponse>)
            webServiceTemplate.marshalSendAndReceive(fullString, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.LOCK_UNLOCK_FAILE);
        }
    }



}
