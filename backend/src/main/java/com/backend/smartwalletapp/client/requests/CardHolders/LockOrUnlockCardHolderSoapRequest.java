package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.XmlElement;

public class LockOrUnlockCardHolderSoapRequest {
    @XmlElement(name = "Status", required = true)
    boolean newStatus;
}
