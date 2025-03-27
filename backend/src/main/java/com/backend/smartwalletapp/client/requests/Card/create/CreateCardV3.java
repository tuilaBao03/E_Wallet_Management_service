package com.backend.smartwalletapp.client.requests.Card.create;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.xml.bind.annotation.XmlAccessType;


@XmlRootElement(name = "CreateCardV3", namespace = "http://schemas.xmlsoap.org/soap/envelope/")
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateCardV3 {
    @XmlElement(name = "ContractSearchMethod",namespace = "http://www.openwaygroup.com/wsint")
    String contractSearchMethod;
    @XmlElement(name = "ContractIdentifier",namespace = "http://www.openwaygroup.com/wsint")
    String contractIdentifier;
    @XmlElement(name = "ProductCode",namespace = "http://www.openwaygroup.com/wsint")
    String productCode;
    @XmlElement(name = "ProductCode2",namespace = "http://www.openwaygroup.com/wsint")
    String productCode2;
    @XmlElement(name = "ProductCode3",namespace = "http://www.openwaygroup.com/wsint")
    String productCode3;
    @XmlElement(name = "InObject", namespace = "http://www.openwaygroup.com/wsint")
    InObject inObject;


    
}
