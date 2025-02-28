package com.backend.smartwalletapp.client.responses.Card;

import java.util.List;

import javax.smartcardio.Card;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@XmlRootElement(name = "GetCardByContractSoapResponse")
public class GetCardByContractSoapResponse {
    @XmlElement(name = "Card")
    List<Card> cards;
    @XmlElement(name="page")
    int page;
    @XmlElement(name = "pageAmount" )
    int pageAmount;
}
