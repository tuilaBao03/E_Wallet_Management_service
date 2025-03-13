package com.backend.smartwalletapp.client.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;

import com.backend.smartwalletapp.client.requests.Card.GetCardByContractSoapRequest;
import com.backend.smartwalletapp.client.requests.Card.LockOrUnlockCardSoapRequest;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.responses.Card.GetCardByContractSoapResponse;
import com.backend.smartwalletapp.client.responses.Card.LockOrUnLockCardSoapResponse;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;

import jakarta.xml.bind.JAXBElement;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CardSoapService {
    private final WebServiceTemplate webServiceTemplate;

    @Value("${Way4Url.ApiKey}")
    private String soapUrl;

    @SuppressWarnings("unchecked")
    public GetCardByContractSoapResponse getCardByContractSoap( String contractId){
        GetCardByContractSoapRequest request = new  GetCardByContractSoapRequest(contractId);
        String fulUrl = soapUrl.toString();
        // Gửi request và nhận response
        try{
        JAXBElement<GetCardByContractSoapResponse> response = 
            (JAXBElement<GetCardByContractSoapResponse>)
            webServiceTemplate.marshalSendAndReceive(fulUrl, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CARD_FAILLE);
        } 
    }

    public CreateCardV3Result createCard( CreateCardV3 request){
        // Gửi request và nhận response
        try{
            CreateCardV3Result response = (CreateCardV3Result) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            return response;
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CARD_FAILLE);
        } 
    }

    // @SuppressWarnings("unchecked")
    // public GetCardByContractSoapResponse createCardByContractSoap( String contractId){
    //     GetCardByContractSoapRequest request = new  GetCardByContractSoapRequest(contractId);
    //     String fulUrl = soapUrl.toString();
    //     // Gửi request và nhận response
    //     try{
    //     JAXBElement<GetCardByContractSoapResponse> response = 
    //         (JAXBElement<GetCardByContractSoapResponse>)
    //         webServiceTemplate.marshalSendAndReceive(fulUrl, request);
    //     return response.getValue();
    //     } catch (Exception e) {
    //         throw new AppException(ErrorCode.GET_CARD_FAILLE);
    //     } 
    // }

    @SuppressWarnings("unchecked")
    public LockOrUnLockCardSoapResponse LockOrUnLock(String cardID, boolean newStatus){
        LockOrUnlockCardSoapRequest request = new LockOrUnlockCardSoapRequest(cardID,newStatus);
        String fulUrl = soapUrl.toString();
        // Gửi request và nhận response
        try{
        JAXBElement<LockOrUnLockCardSoapResponse> response = 
            (JAXBElement<LockOrUnLockCardSoapResponse >)
            webServiceTemplate.marshalSendAndReceive(fulUrl, request);
        return response.getValue();
        } catch (Exception e) {
            throw new AppException(ErrorCode.LOCK_UNLOCK_CARD_FAILE);
        } 
    }

}
