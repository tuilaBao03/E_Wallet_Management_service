package com.backend.smartwalletapp.client.requests.Contract.CreateContractV4;

import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@XmlRootElement(name = "CreateContractV4", namespace = "http://www.openwaygroup.com/wsint")
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
public class CreateContractV4_REQ {

    @XmlElement(name = "ClientSearchMethod", namespace = "http://www.openwaygroup.com/wsint")
    String clientSearchMethod;

    @XmlElement(name = "ClientIdentifier", namespace = "http://www.openwaygroup.com/wsint")
    String clientIdentifier;

    @XmlElement(name = "Reason", namespace = "http://www.openwaygroup.com/wsint")
    String reason;

    @XmlElement(name = "CreateContract_InObject", namespace = "http://www.openwaygroup.com/wsint")
    CreateContractInObject createContractInObject;

    @XmlElement(name = "SetCustomData_InObject", namespace = "http://www.openwaygroup.com/wsint")
    String setCustomDataInObject;
}


