package com.backend.smartwalletapp.client.responses.Contract;

import com.backend.smartwalletapp.model.Contract;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;

@XmlRootElement(name = "LockOrUnLockContractSoapResponse")
@Data
public class LockOrUnLockContractSoapResponse {
    @XmlElement(name = "contract")
    Contract contract;
}
