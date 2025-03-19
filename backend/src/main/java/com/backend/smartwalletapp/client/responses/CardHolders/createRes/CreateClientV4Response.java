package com.backend.smartwalletapp.client.responses.CardHolders.createRes;


import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "CreateClientV4Response", namespace = "http://www.openwaygroup.com/wsint")
public class CreateClientV4Response {

    @XmlElement(name = "CreateClientV4Result", namespace = "http://www.openwaygroup.com/wsint")
    private CreateClientV4Result createClientV4Result;

}