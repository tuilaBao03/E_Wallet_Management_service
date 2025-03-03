package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.XmlElement;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LockOrUnlockCardHolderSoapRequest {
    @XmlElement(name = "Status", required = true)
    boolean newStatus;
    @XmlElement(name = "cardId", required =  true)
    String cardId;

}
