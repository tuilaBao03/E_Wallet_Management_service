package com.backend.smartwalletapp.client.requests.Contract.Get;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;



@XmlRootElement(name = "GetContractByNumberV2", namespace = "http://www.openwaygroup.com/wsint")
@Data
@AllArgsConstructor
@RequiredArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD) 
public class GetContractByNumberV2_REQ {
    @XmlElement(name = "ContractNumber")
    String contractNumber;
}
