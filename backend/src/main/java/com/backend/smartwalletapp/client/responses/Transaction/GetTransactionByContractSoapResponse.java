package com.backend.smartwalletapp.client.responses.Transaction;

import java.util.List;
import com.backend.smartwalletapp.model.Transaction;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@XmlRootElement(name = "GetCardByContractSoapResponse")
public class GetTransactionByContractSoapResponse {
    @XmlElement(name = "Card")
    List<Transaction> tranList;
}
