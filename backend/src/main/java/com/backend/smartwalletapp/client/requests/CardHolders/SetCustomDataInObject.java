package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SetCustomDataInObject {
    
    @XmlElement(name = "SetCustomData", namespace = "http://www.openwaygroup.com/wsint")
    String customData = "";
}
