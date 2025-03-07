package com.backend.smartwalletapp.client.responses.CardHolders;


import com.backend.smartwalletapp.model.CardHolder;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;

@XmlRootElement(name = "CreateCardHolderSoapResponse")
@Data
public class CreateCardHolderSoapResponse {
    @XmlElement(name = "RetCode")
    private int retCode;

    @XmlElement(name = "RetMsg")
    private String retMsg;

    @XmlElement(name = "ResultInfo")
    private String resultInfo;

    @XmlElement(name = "CardHolder")
    private CardHolder cardHolder;
}