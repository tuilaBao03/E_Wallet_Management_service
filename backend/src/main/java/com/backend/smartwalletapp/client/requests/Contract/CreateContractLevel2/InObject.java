package com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2;



import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
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
public class InObject {

    @XmlElement(name = "Branch")
    String branch;

    @XmlElement(name = "InstitutionCode")
    String institutionCode;

    @XmlElement(name = "ContractName")
    String contractName;

    @XmlElement(name = "CBSNumber")
    String cbsNumber;

    @XmlElement(name = "AddInfo01")
    String addInfo01;

    @XmlElement(name = "AddInfo02")
    String addInfo02;
}

