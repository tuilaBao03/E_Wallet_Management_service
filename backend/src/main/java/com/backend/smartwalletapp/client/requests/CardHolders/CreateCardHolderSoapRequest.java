package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@XmlRootElement(name = "CreateContractV4", namespace = "http://www.openwaygroup.com/wsint")
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateCardHolderSoapRequest {

    @XmlElement(name = "ClientSearchMethod", namespace = "http://www.openwaygroup.com/wsint")
    String clientSearchMethod = "CLIENT_NUMBER";

    @XmlElement(name = "ClientIdentifier", namespace = "http://www.openwaygroup.com/wsint")
    String clientIdentifier;

    @XmlElement(name = "Reason", namespace = "http://www.openwaygroup.com/wsint")
    String reason;

    @XmlElement(name = "CreateContract_InObject", namespace = "http://www.openwaygroup.com/wsint")
    CreateContractInObject createContractInObject;

    @XmlElement(name = "SetCustomData_InObject", namespace = "http://www.openwaygroup.com/wsint")
    SetCustomDataInObject setCustomDataInObject;
}
