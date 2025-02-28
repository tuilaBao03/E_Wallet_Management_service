package com.backend.smartwalletapp.client.requests.CardHolders;

import java.math.BigDecimal;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@XmlRootElement(name = "UpdateLimitContractSoapRequest")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateLimitContractSoapRequest {
    @XmlElement(name = "contract")
    String contractId;
    @XmlElement(name = "amount")
    BigDecimal amount;
}
