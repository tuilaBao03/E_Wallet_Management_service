package com.backend.smartwalletapp.client.responses.Card;

import java.util.List;

import javax.smartcardio.Card;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;

@XmlRootElement(name = "GetCardBySearchResponse")
@Data
public class GetCardBySearchSoapResponse {
    @XmlElement(name = "Card")
    List<Card> cards;
    @XmlElement(name="page")
    int page;
    @XmlElement(name = "pageAmount" )
    int pageAmount;

}
