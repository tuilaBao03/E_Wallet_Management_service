package com.backend.smartwalletapp.client.requests.Contract.Edit;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.xml.bind.annotation.XmlAccessType;

@XmlAccessorType(XmlAccessType.FIELD)
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
class EditContract_InObject {

    @XmlElement(name = "Branch", namespace = "http://www.openwaygroup.com/wsint")
    private String branch;

    @XmlElement(name = "ServiceGroup", namespace = "http://www.openwaygroup.com/wsint")
    private String serviceGroup;

    @XmlElement(name = "ContractNumber", namespace = "http://www.openwaygroup.com/wsint")
    private String contractNumber;

    @XmlElement(name = "ContractName", namespace = "http://www.openwaygroup.com/wsint")
    private String contractName;

    @XmlElement(name = "CBSID", namespace = "http://www.openwaygroup.com/wsint")
    private String cbsId;

    @XmlElement(name = "CBSNumber", namespace = "http://www.openwaygroup.com/wsint")
    private String cbsNumber;

    @XmlElement(name = "CloseDate", namespace = "http://www.openwaygroup.com/wsint")
    private String closeDate;
}
