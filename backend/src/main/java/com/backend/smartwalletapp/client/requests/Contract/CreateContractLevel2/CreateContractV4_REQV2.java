package com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2;



import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@XmlRootElement(name = "CreateIssuingContractWithLiabilityV2", namespace = "http://www.openwaygroup.com/wsint")
@XmlAccessorType(XmlAccessType.FIELD)
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
@Getter
@Setter
@Data
public class CreateContractV4_REQV2 {

    
    @XmlElement(name = "LiabCategory")
    String liabCategory;

    @XmlElement(name = "LiabContractSearchMethod")
    String liabContractSearchMethod;

    @XmlElement(name = "LiabContractIdentifier")
    String liabContractIdentifier;

    @XmlElement(name = "ClientSearchMethod")
    String clientSearchMethod;

    @XmlElement(name = "ClientIdentifier")
    String clientIdentifier;

    @XmlElement(name = "ProductCode")
    String productCode;

    @XmlElement(name = "ProductCode2")
    String productCode2;

    @XmlElement(name = "ProductCode3")
    String productCode3;

    @XmlElement(name = "InObject", namespace = "http://www.openwaygroup.com/wsint")
    InObject inObject;
}


