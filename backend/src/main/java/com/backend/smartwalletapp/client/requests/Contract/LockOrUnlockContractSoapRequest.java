package com.backend.smartwalletapp.client.requests.Contract;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@XmlRootElement(name = "LockOrUnlockContractSoapRequest")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LockOrUnlockContractSoapRequest {
    @XmlElement(name = "contractId")
    String contractId; 
    @XmlElement(name = "status")
    boolean newStatus; 
    
}
