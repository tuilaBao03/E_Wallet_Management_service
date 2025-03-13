package com.backend.smartwalletapp.client.responses.Card.create;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@Builder
@AllArgsConstructor
@XmlRootElement(name = "CreateCardV3Result")
public class CreateCardV3Result {
    @XmlElement(name = "CreatedCard")
    String createdCard;
    @XmlElement(name = "CardNumber")
    String cardNumber;
    @XmlElement(name = "ExpiryDate")
    String expiryDate; 
    @XmlElement(name = "SequenceNumber")
    String SequenceNumber;
    @XmlElement(name = "RetCode")
    int retCode;
    @XmlElement(name = "RetMsg")
    String RetMsg;
    @XmlElement(name = "ResultInfo")
    String ResultInfo; 
}