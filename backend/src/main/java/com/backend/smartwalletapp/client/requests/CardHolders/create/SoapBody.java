package com.backend.smartwalletapp.client.requests.CardHolders.create;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlElement;

@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
@Builder
public class SoapBody {

    @XmlElement(name = "CreateClientV4", namespace = "http://www.openwaygroup.com/wsint")
    private CreateClientV4Body createClientV4;
}

