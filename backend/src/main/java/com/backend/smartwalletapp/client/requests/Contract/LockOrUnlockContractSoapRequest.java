package com.backend.smartwalletapp.client.requests.Contract;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@XmlRootElement(name = "LockOrUnlockContractSoapRequest")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LockOrUnlockContractSoapRequest {
    @XmlElement(name = "contractId")
    String contractId; 
    @XmlElement(name = "status")
    boolean newStatus; 
    
}
