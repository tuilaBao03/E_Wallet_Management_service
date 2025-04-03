package com.backend.smartwalletapp.client.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import org.springframework.ws.client.core.WebServiceTemplate;

import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.requests.Contract.Edit.EditContractV4;
import com.backend.smartwalletapp.client.requests.Contract.Get.GetContractByNumberV2_REQ;
import com.backend.smartwalletapp.client.requests.Contract.Get.GetContractsByClientV2_REQ;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Result;
import com.backend.smartwalletapp.client.responses.Contract.create.V2CreateContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.edit.EditContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.edit.EditContractV4Result;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractByNumberV2Response;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractByNumberV2Result;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractsByClientV2Response;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractsByClientV2Result;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import lombok.RequiredArgsConstructor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
@RequiredArgsConstructor
public class ContractSoapService {
    private static final Logger log = LoggerFactory.getLogger(ContractSoapService.class);
    private final WebServiceTemplate webServiceTemplate;

    @Value("${Way4Url.ApiKey}")
    private String soapUrl;


    public GetContractsByClientV2Result getContractByClientIdentifier(String clientIdentifier) {
        GetContractsByClientV2_REQ request = new GetContractsByClientV2_REQ("CLIENT_NUMBER", clientIdentifier);
    
        try {
            System.err.println("\n_______________________start________________\n");


            GetContractsByClientV2Response response = (GetContractsByClientV2Response) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            

            return response.getResult();
        } 
        catch (Exception e) {
            log.error("\\n" + //
                                "Unexpected error: {}\\n" + //
                                                                        "", e.getMessage(), e);
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }
    


    public GetContractByNumberV2Result getContractByContractNumber(String contractNumber) {
        String fullString = soapUrl;
        GetContractByNumberV2_REQ request = new GetContractByNumberV2_REQ(contractNumber);
        try {
            GetContractByNumberV2Response response = (GetContractByNumberV2Response) webServiceTemplate.marshalSendAndReceive(fullString, request);
            return response.getResult();
        } catch (Exception e) {
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }

    public CreateContractV4Result createContract(CreateContractV4_REQ request) {
        try {
            CreateContractV4Response response = (CreateContractV4Response) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            CreateContractV4Result result = response.getCreateContractV4Result();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }

    public CreateContractV4Result createContractLevel2(CreateContractV4_REQV2 request) {
        try {
            V2CreateContractV4Response response = (V2CreateContractV4Response) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            System.err.println("\n response CreateContractV4Response :\n " + response.getCreateContractV4Result());
            CreateContractV4Result result = response.getCreateContractV4Result();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CONTRACT_FAILE);
        }
    }

    public EditContractV4Result editContract(EditContractV4 request) {
        try {
            System.err.println("\n ------------request EditContractV4  :---------------------\n " + request);
            EditContractV4Response response = (EditContractV4Response) webServiceTemplate.marshalSendAndReceive(soapUrl, request);
            System.err.println("\n ------------response EditContractV4  :-----------------\n " + response);
            // System.err.println("\n response CreateContractV4Response :\n " + response.getCreateContractV4Result());
            // CreateContractV4Result result = response.getCreateContractV4Result();
            // System.err.println("\n -----------result CreateContractV4Result :----------------------\n " + result);
            return response.getResult();
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.UPDATE_CONTRACT_FAILE);
        }
    }

    // @SuppressWarnings("unchecked")
    // public UpdateLimitContractSoapResponse UpdateLimitContractByCardHolder(String contractId, BigDecimal limit) {
    //     String fullString = soapUrl + "/cardHolder";
    //     UpdateLimitContractSoapRequest request = new UpdateLimitContractSoapRequest(contractId, limit);
    //     try {
    //         JAXBElement<UpdateLimitContractSoapResponse> response =
    //         (JAXBElement<UpdateLimitContractSoapResponse>)
    //         webServiceTemplate.marshalSendAndReceive(fullString, request);
    //         return response.getValue();
    //     } catch (Exception e) {
    //         throw new AppException(ErrorCode.UPDATE_CONTRACT_FAILE);
    //     }
    // }

    // @SuppressWarnings("unchecked")
    // public LockOrUnLockContractSoapResponse LockOrUnLockContractSoap(String contractId, boolean newstatus) {
    //     String fullString = soapUrl + "/cardHolder";
    //     LockOrUnlockContractSoapRequest request = new LockOrUnlockContractSoapRequest(contractId, newstatus);
    //     try {
    //         JAXBElement<LockOrUnLockContractSoapResponse> response =
    //         (JAXBElement<LockOrUnLockContractSoapResponse>)
    //         webServiceTemplate.marshalSendAndReceive(fullString, request);
    //         return response.getValue();
    //     } catch (Exception e) {
    //         throw new AppException(ErrorCode.LOCK_UNLOCK_FAILE);
    //     }
    // }
}
