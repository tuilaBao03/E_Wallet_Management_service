package com.backend.smartwalletapp.client;

import org.springframework.stereotype.Component;

import com.backend.smartwalletapp.dto.response.CardHolder.CardHolderResponse;

@Component
public class SoapCardHolder {
    public CardHolderResponse getUsersFromSoap(int page, int size) {
        String soapUrl = "http://example.com/soap-api"; // URL của SOAP API
    
        // Tạo request đúng kiểu
        CardHolderRequest request = new CardHolderRequest();
        request.setPage(page);
        request.setSize(size);
    
        // Gửi request SOAP và nhận response
        return (CardHolderResponse) getWebServiceTemplate().marshalSendAndReceive(soapUrl, request);
    }
}
