package com.backend.smartwalletapp.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.client.support.interceptor.ClientInterceptor;
import com.backend.smartwalletapp.client.interceptor.SoapClientLoggingInterceptor;
import com.backend.smartwalletapp.client.requests.Card.ActivateCard;
import com.backend.smartwalletapp.client.requests.Card.SetCardStatus;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.CardHolders.edit.EditClientV6;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.requests.Contract.Edit.EditContractV4;
import com.backend.smartwalletapp.client.requests.Contract.Get.GetContractByNumberV2_REQ;
import com.backend.smartwalletapp.client.requests.Contract.Get.GetContractsByClientV2_REQ;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Response;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.client.responses.Card.setState.ActivateCardResponse;
import com.backend.smartwalletapp.client.responses.Card.setState.ActivateCardResult;
import com.backend.smartwalletapp.client.responses.Card.setState.SetCardStatusResponse;
import com.backend.smartwalletapp.client.responses.Card.setState.SetCardStatusResult;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Response;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.create.V2CreateContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.edit.EditContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractByNumberV2Response;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractsByClientV2Response;

@Configuration
public class SoapConfig {

    @Bean
    Jaxb2Marshaller marshaller() {
        System.out.println("Creating marshaller");
        Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
        System.out.println("Creating marshaller____________________");
        // Gán danh sách các class JAXB cụ thể cần dùng
        try {
            System.out.println("Creating marshaller...");
            marshaller.setClassesToBeBound(
                CreateContractV4_REQ.class,
                CreateContractV4Response.class,
                CreateClientV4Response.class,
                CreateClientV4Body.class,
                CreateContractV4_REQV2.class,
                V2CreateContractV4Response.class,
                GetContractsByClientV2_REQ.class,
                GetContractsByClientV2Response.class,
                GetContractByNumberV2_REQ.class,
                GetContractByNumberV2Response.class,
                CreateCardV3Response.class,
                CreateCardV3.class,
                EditClientV6.class,
                EditContractV4Response.class, 
                
                EditContractV4.class,

                SetCardStatusResponse.class,
                SetCardStatus.class,

                ActivateCardResponse.class,
                ActivateCard.class


            );
            System.out.println("Marshaller initialized successfully.");
        } catch (Exception e) {
            System.err.println("Error while initializing marshaller: " + e.getMessage());
            e.printStackTrace();
        }
        return marshaller;
    }
    @Bean
    WebServiceTemplate webServiceTemplate(Jaxb2Marshaller marshaller, SoapClientLoggingInterceptor loggingInterceptor) {
        WebServiceTemplate webServiceTemplate = new WebServiceTemplate();
        try {
            webServiceTemplate.setMarshaller(marshaller);
            webServiceTemplate.setUnmarshaller(marshaller);
            webServiceTemplate.setInterceptors(new ClientInterceptor[]{loggingInterceptor});
        } catch (Exception e) {
            e.printStackTrace();
        }
        // webServiceTemplate.setMarshaller(marshaller);
        // webServiceTemplate.setUnmarshaller(marshaller);
        // webServiceTemplate.setInterceptors(new ClientInterceptor[]{loggingInterceptor});
        return webServiceTemplate;
    }
}
