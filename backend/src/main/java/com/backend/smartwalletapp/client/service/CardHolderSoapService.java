package com.backend.smartwalletapp.client.service;
import org.springframework.stereotype.Service;
import org.springframework.ws.client.core.WebServiceTemplate;
import com.backend.smartwalletapp.client.requests.CardHolders.CreateCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.GetCardHolderBySearchSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.client.responses.CardHolders.CreateCardHolderSoapResponse;
import com.backend.smartwalletapp.client.responses.CardHolders.GetCardHolderBySearchResponse;
import com.backend.smartwalletapp.client.responses.CardHolders.LockOrUnlockCardHolderSoapResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import jakarta.xml.bind.JAXBElement;
import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class CardHolderSoapService {
    private final WebServiceTemplate webServiceTemplate;
    private String soapUrl = "http://example.com/soap-api/contracts";
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
            throw new AppException(ErrorCode.GET_CARDHOLDER_FAILE);
        }
    }
    @SuppressWarnings("unchecked")
    public CreateCardHolderSoapResponse CreateCardHolder(CreateCardHolderSoapRequest request){
        String fullUrl = soapUrl + "/cardholder/created";
        try{
            JAXBElement<CreateCardHolderSoapResponse> response =
            (JAXBElement<CreateCardHolderSoapResponse>)
        webServiceTemplate.marshalSendAndReceive(fullUrl, request);
    return response.getValue();
        }
        catch(Exception e){
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }
    @SuppressWarnings("unchecked")
    public CreateCardHolderSoapResponse UpdateCardHolder(CreateCardHolderSoapRequest request, String id){
        String fullUrl = soapUrl + "/cardholder/{id}";
        try{
            JAXBElement<CreateCardHolderSoapResponse> response =
            (JAXBElement<CreateCardHolderSoapResponse>)
        webServiceTemplate.marshalSendAndReceive(fullUrl, request);
    return response.getValue();
        }
        catch(Exception e){
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }
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