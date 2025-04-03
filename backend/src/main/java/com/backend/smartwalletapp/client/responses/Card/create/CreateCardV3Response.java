package com.backend.smartwalletapp.client.responses.Card.create;

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
@XmlRootElement(name = "CreateCardV3Response",namespace = "http://www.openwaygroup.com/wsint")
public class CreateCardV3Response {
    @XmlElement(name = "CreateCardV3Result", namespace = "http://www.openwaygroup.com/wsint")
    CreateCardV3Result createCardV3Result;
    
}