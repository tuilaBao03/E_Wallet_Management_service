package com.backend.smartwalletapp.client.requests.Card.create;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;
import jakarta.xml.bind.annotation.XmlAccessType;


@XmlRootElement(name = "CreateCardV3", namespace = "http://schemas.xmlsoap.org/soap/envelope/")
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
public class CreateCardV3 {
    @XmlElement(name = "ContractSearchMethod")
    String contractSearchMethod;
    @XmlElement(name = "ContractIdentifier")
    String contractIdentifier;
    @XmlElement(name = "ProductCode")
    String productCode;
    @XmlElement(name = "ProductCode2")
    String productCode2;
    @XmlElement(name = "ProductCode3")
    String productCode3;

    @XmlElement(name = "InObject", namespace = "http://www.openwaygroup.com/wsint")
    InObject inObject;


    
}
