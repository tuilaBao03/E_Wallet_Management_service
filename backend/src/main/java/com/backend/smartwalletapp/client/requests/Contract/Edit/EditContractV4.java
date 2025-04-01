package com.backend.smartwalletapp.client.requests.Contract.Edit;
import jakarta.xml.bind.annotation.*;
import lombok.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "EditContractV4", namespace = "http://www.openwaygroup.com/wsint")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EditContractV4 {
    @XmlElement(name = "ContractSearchMethod", namespace = "http://www.openwaygroup.com/wsint")
    private String contractSearchMethod;

    @XmlElement(name = "ContractIdentifier", namespace = "http://www.openwaygroup.com/wsint")
    private String contractIdentifier;

    @XmlElement(name = "Reason", namespace = "http://www.openwaygroup.com/wsint")
    private String reason;

    @XmlElement(name = "EditContract_InObject", namespace = "http://www.openwaygroup.com/wsint")
    private EditContract_InObject_EditV4 editContractInObject;

    @XmlElement(name = "SetCustomData_InObject", namespace = "http://www.openwaygroup.com/wsint")
    private SetCustomData_InObject_EditV4 customData;
}


