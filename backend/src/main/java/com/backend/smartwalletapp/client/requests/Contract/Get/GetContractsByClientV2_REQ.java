package com.backend.smartwalletapp.client.requests.Contract.Get;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;



@XmlRootElement(name = "GetContractsByClientV2")
@Data
@AllArgsConstructor
@RequiredArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)  // Thêm dòng này
public class GetContractsByClientV2_REQ {
    @XmlElement(name = "ClientSearchMethod")
    String clientSearchMethod;
    @XmlElement(name = "ClientIdentifier")
    String clientIdentifier;
    
}
