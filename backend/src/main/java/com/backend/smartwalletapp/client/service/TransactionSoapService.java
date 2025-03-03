package com.backend.smartwalletapp.client.service;

import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;

import com.backend.smartwalletapp.client.requests.Transaction.GetTranByTransactionSoapRequest;
import com.backend.smartwalletapp.client.responses.Transaction.GetTransactionByContractSoapResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;

import jakarta.xml.bind.JAXBElement;
import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class TransactionSoapService {
    private final WebServiceTemplate webServiceTemplate;
    private String soapUrl = "http://example.com/soap-api/contracts";

    @SuppressWarnings("unchecked")
    public GetTransactionByContractSoapResponse getTransactionByContractSoap( String contractId){
        GetTranByTransactionSoapRequest request = new GetTranByTransactionSoapRequest(contractId);
        String fulUrl = soapUrl.toString();
        // Gửi request và nhận response
        try{
        JAXBElement<GetTransactionByContractSoapResponse> response = 
            (JAXBElement<GetTransactionByContractSoapResponse>)
            webServiceTemplate.marshalSendAndReceive(fulUrl, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_TRAN_FAILLE);
        } 
    }
}
