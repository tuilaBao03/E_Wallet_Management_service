package com.backend.smartwalletapp.client.requests.CardHolders.create;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

import java.util.List;
@XmlRootElement(name = "CreateClientV4", namespace = "http://schemas.xmlsoap.org/soap/envelope/")
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreateClientV4Body {
    
    @XmlElement(name = "Reason")
    private String reason;

    @XmlElement(name = "CreateClient_InObject", namespace = "http://www.openwaygroup.com/wsint")
    private CreateClientInObject createClientInObject;

    @XmlElement(name = "SetCustomData_InObject", namespace = "http://www.openwaygroup.com/wsint")
    private List<SetCustomDataInObject> setCustomDataInObjects;
}

