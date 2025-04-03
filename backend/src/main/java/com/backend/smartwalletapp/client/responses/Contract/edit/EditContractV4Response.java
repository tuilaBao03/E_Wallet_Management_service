package com.backend.smartwalletapp.client.responses.Contract.edit;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;


@XmlAccessorType(XmlAccessType.FIELD)

@Data
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@XmlRootElement(name = "EditContractV4Response", namespace = "http://www.openwaygroup.com/wsint")
public class EditContractV4Response {
    @XmlElement(name = "EditContractV4Result",namespace = "http://www.openwaygroup.com/wsint")
    EditContractV4Result result;

    
}