package com.backend.smartwalletapp.client.responses.CardHolders;
import com.backend.smartwalletapp.model.CardHolder;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;
import lombok.NoArgsConstructor;

@XmlRootElement(name = "LockOrUnlockCardHolderSoapResponse")
@Data
@NoArgsConstructor
public class LockOrUnlockCardHolderSoapResponse {
    @XmlElement(name = "CardHolder")
    private CardHolder cardHolder;
}
