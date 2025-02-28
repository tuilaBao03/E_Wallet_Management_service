package com.backend.smartwalletapp.client.requests.Contract;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@XmlRootElement(name = "GetContractByCardHolderSoapRequest")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetContractByCardHolderSoapRequest {
    @XmlElement(name = "CardHolderId")
    String CardHolderId; 
}
