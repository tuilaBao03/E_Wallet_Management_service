package com.backend.smartwalletapp.client.requests.Transaction;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@XmlRootElement(name = "GetCardByContractSoapRequest")
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GetTranByTransactionSoapRequest{
    @XmlElement(name = "ContractId")
    String ContractId; 
}