package com.backend.smartwalletapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.ws.client.core.WebServiceTemplate;
import org.springframework.ws.transport.http.HttpUrlConnectionMessageSender;

@Configuration
public class SoapConfig {
        @Bean
    public WebServiceTemplate webServiceTemplate() {
        WebServiceTemplate webServiceTemplate = new WebServiceTemplate();
        
        // Cấu hình sender (nếu cần xác thực hoặc proxy)
        webServiceTemplate.setMessageSender(new HttpUrlConnectionMessageSender());
        return webServiceTemplate;
    }
}
