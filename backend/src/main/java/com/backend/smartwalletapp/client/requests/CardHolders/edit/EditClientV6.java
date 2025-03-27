package com.backend.smartwalletapp.client.requests.CardHolders.edit;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.*;
import lombok.*;


@XmlRootElement(name = "EditClientV6", namespace = "http://www.openwaygroup.com/wsint")
@XmlAccessorType(XmlAccessType.FIELD)

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EditClientV6 {
    @XmlElement(name = "ClientSearchMethod", namespace = "http://www.openwaygroup.com/wsint")
    private String clientSearchMethod;

    @XmlElement(name = "ClientIdentifier", namespace = "http://www.openwaygroup.com/wsint")
    private String clientIdentifier;

    @XmlElement(name = "Reason", namespace = "http://www.openwaygroup.com/wsint")
    private String reason;

    @XmlElement(name = "EditClient_InObject", namespace = "http://www.openwaygroup.com/wsint")
    private EditClient_InObject editClientInObject;

    @XmlElement(name = "SetCustomData_InObject", namespace = "http://www.openwaygroup.com/wsint")
    private SetCustomData_InObject setCustomData_InObject;
}
