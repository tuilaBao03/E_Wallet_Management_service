package com.backend.smartwalletapp.client.responses.Card.setState;


import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "SetCardStatusResponse",namespace = "http://www.openwaygroup.com/wsint")
public class SetCardStatusResponse {
    @XmlElement(name = "SetCardStatusResult", namespace = "http://www.openwaygroup.com/wsint")
    SetCardStatusResult createCardV3Result;
    
}
