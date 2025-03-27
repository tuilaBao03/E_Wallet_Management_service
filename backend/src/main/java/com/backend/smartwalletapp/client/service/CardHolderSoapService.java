package com.backend.smartwalletapp.client.service;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.soap.client.SoapFaultClientException;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.CardHolders.edit.EditClientV6;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Response;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class CardHolderSoapService {
    private final WebServiceTemplate webServiceTemplate;
    private String soapUrl = "http://10.145.48.222:17000/webservice_int/ws";

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

    public ApiResponse editCardHolder(EditClientV6 request){
        try {
            System.err.println("\n ------------request EditClientV6  :---------------------\n " + request);
            ApiResponse response = (ApiResponse) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            System.err.println("\n ------------response EditClientV6  :-----------------\n " + response);
            // System.err.println("\n response CreateContractV4Response :\n " + response.getCreateContractV4Result());
            // CreateContractV4Result result = response.getCreateContractV4Result();
            // System.err.println("\n -----------result CreateContractV4Result :----------------------\n " + result);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.CONTRACT_NOT_EXISTS);
        }
    } 
}