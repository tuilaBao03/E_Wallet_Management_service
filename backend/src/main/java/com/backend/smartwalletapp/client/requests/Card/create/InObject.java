package com.backend.smartwalletapp.client.requests.Card.create;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlAccessType;

@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

public class InObject {

    @XmlElement(name = "CardName")
    String cardName;
    @XmlElement(name = "CBSNumber")
    String  cbsNumber;
    @XmlElement(name = "EmbossedFirstName")
    String  embossedFirstName;
    @XmlElement(name = "EmbossedLastName")
    String  embossedLastName;
    @XmlElement(name = "EmbossedCompanyName")
    String  embossedCompanyName;
}
