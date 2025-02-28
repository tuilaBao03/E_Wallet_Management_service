package com.backend.smartwalletapp.client.requests.Contract;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@XmlRootElement(name = "GetContractBysearchSoapRequest")
public class GetContractBysearchSoapRequest {
    @XmlElement(name = "search")
    String search;
    @XmlElement(name = "page")
    int page;
}
