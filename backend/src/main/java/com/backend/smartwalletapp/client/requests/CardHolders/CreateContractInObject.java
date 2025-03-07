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
public class CreateContractInObject {

    @XmlElement(name = "Branch", namespace = "http://www.openwaygroup.com/wsint")
    String branch;

    @XmlElement(name = "InstitutionCode", namespace = "http://www.openwaygroup.com/wsint")
    String institutionCode;

    @XmlElement(name = "ProductCode", namespace = "http://www.openwaygroup.com/wsint")
    String productCode;

    @XmlElement(name = "ProductCode2", namespace = "http://www.openwaygroup.com/wsint")
    String productCode2;

    @XmlElement(name = "ProductCode3", namespace = "http://www.openwaygroup.com/wsint")
    String productCode3;

    @XmlElement(name = "ContractName", namespace = "http://www.openwaygroup.com/wsint")
    String contractName;

    @XmlElement(name = "CBSNumber", namespace = "http://www.openwaygroup.com/wsint")
    String cbsNumber;
}
