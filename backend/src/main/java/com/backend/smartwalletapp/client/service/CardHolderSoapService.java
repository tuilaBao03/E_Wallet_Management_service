package com.backend.smartwalletapp.client.service;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.soap.SoapElement;
import org.springframework.ws.soap.client.SoapFaultClientException;
import org.springframework.ws.wsdl.wsdl11.provider.SoapProvider;

import com.backend.smartwalletapp.client.requests.CardHolders.GetCardHolderBySearchSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.CardHolders.create.SoapEnvelope;
import com.backend.smartwalletapp.client.responses.CardHolders.GetCardHolderBySearchResponse;
import com.backend.smartwalletapp.client.responses.CardHolders.LockOrUnlockCardHolderSoapResponse;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Response;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import jakarta.xml.bind.JAXBElement;
import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class CardHolderSoapService {
    private final WebServiceTemplate webServiceTemplate;
    private String soapUrl = "http://10.145.48.222:17000/webservice_int/ws";
    @SuppressWarnings("unchecked")
    public GetCardHolderBySearchResponse getCardHolderFromSoap(String name, int page) {
        // Tạo request có tham số tìm kiếm
        GetCardHolderBySearchSoapRequest request = new GetCardHolderBySearchSoapRequest(name, page);
        String fulUrl = soapUrl.toString();
        // Gửi request và nhận response

        try{
        JAXBElement<GetCardHolderBySearchResponse> response = 
            (JAXBElement<GetCardHolderBySearchResponse>)
            webServiceTemplate.marshalSendAndReceive(fulUrl, request);
        return response.getValue();
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CARDHOLDER_FAILE);
        }
    }
    public CreateClientV4Response createCardHolder(CreateClientV4Body request) {
        String fullUrl = soapUrl;
        try {
            System.out.println("[SOAP REQUEST] CreateCardHolderSoapRequest: " + request);
            CreateClientV4Response response =
            (CreateClientV4Response) webServiceTemplate.marshalSendAndReceive(fullUrl, request);
            System.out.println("[SOAP RESPONSE] CreateCardHolderSoapResponse: " + response);
            return response;
        } catch (SoapFaultClientException soapEx) {
            System.err.println("[SOAP ERROR] Lỗi SOAP: " + soapEx.getFaultStringOrReason());
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        } catch (HttpClientErrorException httpEx) {
            System.err.println("[HTTP ERROR] HTTP Status: " + httpEx.getStatusCode());
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        } catch (Exception e) {
            System.err.println("[UNKNOWN ERROR] " + e.getMessage());
            e.printStackTrace();
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }

    // @SuppressWarnings("unchecked")
    // public CreateCardHolderSoapResponse UpdateCardHolder(CreateCardHolderSoapRequest request, String id){
    //     String fullUrl = soapUrl + "/cardholder/{id}";
    //     try{
    //         JAXBElement<CreateCardHolderSoapResponse> response =
    //         (JAXBElement<CreateCardHolderSoapResponse>)
    //     webServiceTemplate.marshalSendAndReceive(fullUrl, request);
    // return response.getValue();
    //     }
    //     catch(Exception e){
    //         throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
    //     }
    // }
    @SuppressWarnings("unchecked")
    public LockOrUnlockCardHolderSoapResponse UpdateStatusCardHolder(LockOrUnlockCardHolderSoapRequest lockOrUnlockCardHolderSoapRequest, String id){
        String fullUrl = soapUrl + "/cardholder/{id}";
        try{
            JAXBElement<LockOrUnlockCardHolderSoapResponse> response =
            (JAXBElement<LockOrUnlockCardHolderSoapResponse>)
             webServiceTemplate.marshalSendAndReceive(fullUrl, lockOrUnlockCardHolderSoapRequest);
            return response.getValue();
        }
        catch(Exception e){
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }
}