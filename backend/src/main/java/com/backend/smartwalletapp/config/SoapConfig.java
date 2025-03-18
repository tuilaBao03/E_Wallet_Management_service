package com.backend.smartwalletapp.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.client.support.interceptor.ClientInterceptor;

import com.backend.smartwalletapp.client.interceptor.SoapClientLoggingInterceptor;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.Contract.GetContractsByClientV2;
import com.backend.smartwalletapp.client.requests.Contract.GetContractsByClientV2_ContractNumber;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Response;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.create.V2CreateContractV4Response;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractByNumberV2Response;
import com.backend.smartwalletapp.client.responses.Contract.get.GetContractsByClientV2Response;
import com.backend.smartwalletapp.dto.response.Card.GetCardByContractReponse;



@Configuration
public class SoapConfig {

    @Bean
    Jaxb2Marshaller marshaller() {
        System.out.println("Creating marshaller");
        Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
        System.out.println("Creating marshaller____________________");
        // Gán danh sách các class JAXB cụ thể cần dùng
        marshaller.setClassesToBeBound(
            CreateContractV4_REQ.class,
            CreateContractV4Response.class,

            // chạy đồng thời chắc chắn lỗi ( chạy riêng 2 cặp thì không sao )
            CreateClientV4Response.class,
            CreateClientV4Body.class,

            CreateContractV4_REQV2.class,
            V2CreateContractV4Response.class,
            // CreateCardV3.class,
            // CreateCardV3Result.class

            GetContractsByClientV2.class,
            GetContractsByClientV2Response.class,

            
            GetContractsByClientV2_ContractNumber.class,
            GetContractByNumberV2Response.class
            
        );
        System.out.println("Created marshaller____________________");

        return marshaller;
    }


    @Bean
    WebServiceTemplate webServiceTemplate(Jaxb2Marshaller marshaller, SoapClientLoggingInterceptor loggingInterceptor) {
        WebServiceTemplate webServiceTemplate = new WebServiceTemplate();
        webServiceTemplate.setMarshaller(marshaller);
        webServiceTemplate.setUnmarshaller(marshaller);
        webServiceTemplate.setInterceptors(new ClientInterceptor[]{loggingInterceptor});
        return webServiceTemplate;
    }
}
