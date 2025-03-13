package com.backend.smartwalletapp.client.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.ws.client.support.interceptor.ClientInterceptor;
import org.springframework.ws.context.MessageContext;
import org.springframework.ws.WebServiceMessage;
import org.springframework.ws.soap.saaj.SaajSoapMessage;

import jakarta.xml.soap.SOAPElement;
import jakarta.xml.soap.SOAPException;
import jakarta.xml.soap.SOAPHeader;
import jakarta.xml.soap.SOAPMessage;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Component
public class SoapClientLoggingInterceptor implements ClientInterceptor {

    @Override
    public boolean handleRequest(MessageContext messageContext) {
        System.out.println("====[SOAP Request]====");

        // Add Header to SOAP Request
        addSoapHeader(messageContext.getRequest());

        // Log Request
        logMessage(messageContext.getRequest());
        return true;
    }

    @Override
    public boolean handleResponse(MessageContext messageContext) {
        System.out.println("====[SOAP Response]====");
        logMessage(messageContext.getResponse());
        return true;
    }

    @Override
    public boolean handleFault(MessageContext messageContext) {
        System.out.println("====[SOAP Fault]====");
        logMessage(messageContext.getResponse());
        return true;
    }

    @Override
    public void afterCompletion(MessageContext messageContext, Exception ex) {
        System.out.println("====[SOAP After Completion]====");
        if (ex != null) {
            System.err.println("Exception occurred: " + ex.getMessage());
        }
    }

    /**
     * Log SOAP message content to console
     */
    private void logMessage(WebServiceMessage message) {
        try (ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            message.writeTo(out);
            String msg = new String(out.toByteArray(), StandardCharsets.UTF_8);
            System.out.println(msg);
        } catch (IOException e) {
            System.err.println("Error logging SOAP message: " + e.getMessage());
        }
    }

    /**
     * Add custom SOAP Header as required
     */
    private void addSoapHeader(WebServiceMessage message) {
        try {
            SaajSoapMessage saajSoapMessage = (SaajSoapMessage) message;
            SOAPMessage soapMsg = saajSoapMessage.getSaajMessage();

            // Always create header if not exists
            SOAPHeader header = soapMsg.getSOAPHeader();
            if (header == null) {
                header = soapMsg.getSOAPPart().getEnvelope().addHeader();
            }

            // Define namespace and prefix
            String namespace = "http://www.openwaygroup.com/wsint";
            String prefix = "wsin";

            // Add SessionContextStr
            SOAPElement sessionContextStr = header.addChildElement("SessionContextStr", prefix, namespace);
            sessionContextStr.addTextNode("?"); // Replace with actual value when needed

            // Add UserInfo as TEXT, not attribute
            SOAPElement userInfo = header.addChildElement("UserInfo", prefix, namespace);
            userInfo.addTextNode("officer=\"WX_ADMIN\""); // Correct format as required

            // Add CorrelationId
            SOAPElement correlationId = header.addChildElement("CorrelationId", prefix, namespace);
            correlationId.addTextNode("?"); // Replace with actual value when needed

            // Save changes to the message
            soapMsg.saveChanges();

        } catch (SOAPException e) {
            System.err.println("Error adding SOAP header: " + e.getMessage());
        }
    }
}
