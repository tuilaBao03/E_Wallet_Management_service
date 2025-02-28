package com.backend.smartwalletapp.client.responses.Contract;

import java.util.List;
import com.backend.smartwalletapp.model.Contract;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@XmlRootElement(name = "GetContractBySearchSoapResponse")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetContractBySearchSoapResponse {
    @XmlElement(name = "contracts")
    List<Contract> contracts;
    
    @XmlElement(name = "page")
    int page;
    
    @XmlElement(name = "pageAmount")
    int pageAmount;

}
