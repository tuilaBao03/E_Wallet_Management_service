package com.backend.smartwalletapp.client.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CardSoapService {
    private final WebServiceTemplate webServiceTemplate;

    @Value("${Way4Url.ApiKey}")
    private String soapUrl;

    public CreateCardV3Result createCard( CreateCardV3 request){
        // Gửi request và nhận response
        try{
            CreateCardV3Result response = (CreateCardV3Result) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            return response;
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CARD_FAILLE);
        } 
    }

}
