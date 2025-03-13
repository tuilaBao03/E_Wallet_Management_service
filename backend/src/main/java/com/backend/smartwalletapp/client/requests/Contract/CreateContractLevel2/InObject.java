package com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2;



import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@XmlRootElement(name = "Root") // Nếu cần ánh xạ luôn Root
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class InObject {

    @XmlElement(name = "Branch", namespace = "http://example.com/wsin")
    String branch;

    @XmlElement(name = "InstitutionCode", namespace = "http://example.com/wsin")
    String institutionCode;

    @XmlElement(name = "ContractName", namespace = "http://example.com/wsin")
    String contractName;

    @XmlElement(name = "CBSNumber", namespace = "http://example.com/wsin")
    String cbsNumber;

    @XmlElement(name = "AddInfo01", namespace = "http://example.com/wsin")
    String addInfo01;

    @XmlElement(name = "AddInfo02", namespace = "http://example.com/wsin")
    String addInfo02;
}

