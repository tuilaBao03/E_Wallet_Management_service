package com.backend.smartwalletapp.client.requests.Card;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;
@Data

@XmlRootElement(name = "GetCardByContractSoapRequest")
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LockOrUnlockCardSoapRequest {
    @XmlElement(name = "ContractId")
    String ContractId; 
    @XmlElement(name = "status")
    boolean newStatus; 
}
