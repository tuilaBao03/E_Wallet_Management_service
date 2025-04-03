package com.backend.smartwalletapp.client.responses.Contract.edit;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlElement;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class EditContractV4Result {
        @XmlElement(name = "CreatedCard", namespace = "http://www.openwaygroup.com/wsint")
    String createdCard;
    @XmlElement(name = "CardNumber", namespace = "http://www.openwaygroup.com/wsint")
    String cardNumber;
    @XmlElement(name = "ExpiryDate", namespace = "http://www.openwaygroup.com/wsint")
    String expiryDate; 
    @XmlElement(name = "SequenceNumber", namespace = "http://www.openwaygroup.com/wsint")
    String SequenceNumber;
    @XmlElement(name = "RetCode", namespace = "http://www.openwaygroup.com/wsint")
    int retCode;
    @XmlElement(name = "RetMsg", namespace = "http://www.openwaygroup.com/wsint")
    String RetMsg;
    @XmlElement(name = "ResultInfo", namespace = "http://www.openwaygroup.com/wsint")
    String ResultInfo; 
}
