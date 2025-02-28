package com.backend.smartwalletapp.client.requests.Card;

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
class GetCardByContractSoapRequest{
    @XmlElement(name = "ContractId")
    String ContractId; 
}