package com.backend.smartwalletapp.client.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;

import com.backend.smartwalletapp.client.requests.Card.ActivateCard;
import com.backend.smartwalletapp.client.requests.Card.SetCardStatus;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Response;
import com.backend.smartwalletapp.client.responses.Card.setState.ActivateCardResponse;
import com.backend.smartwalletapp.client.responses.Card.setState.ActivateCardResult;
import com.backend.smartwalletapp.client.responses.Card.setState.SetCardStatusResponse;
import com.backend.smartwalletapp.client.responses.Card.setState.SetCardStatusResult;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CardSoapService {
    private final WebServiceTemplate webServiceTemplate;

    @Value("${Way4Url.ApiKey}")
    private String soapUrl;

    public CreateCardV3Response createCard( CreateCardV3 request){
        // Gửi request và nhận response
        try{
            CreateCardV3Response response = (CreateCardV3Response) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            return response;
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CARD_FAILLE);
        } 
    }

    public SetCardStatusResult setCardStatus( SetCardStatus request){
        // Gửi request và nhận response
        try{
            SetCardStatusResponse response = (SetCardStatusResponse) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            return response.getCreateCardV3Result();
        } catch (Exception e) {
            throw new AppException(ErrorCode.LOCK_UNLOCK_CARD_FAILE);
        } 
    }

    public ActivateCardResult activateCard( ActivateCard request){
        // Gửi request và nhận response
        try{
            ActivateCardResponse response = (ActivateCardResponse) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            return response.getActivateCardResult();
        } catch (Exception e) {
            throw new AppException(ErrorCode.LOCK_UNLOCK_CARD_FAILE);
        } 
    }

}
