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
    @XmlElement(name = "CardName",namespace = "http://www.openwaygroup.com/wsint")
    String cardName;
    @XmlElement(name = "CBSNumber",namespace = "http://www.openwaygroup.com/wsint")
    String  cbsNumber;
    @XmlElement(name = "EmbossedFirstName",namespace = "http://www.openwaygroup.com/wsint")
    String  embossedFirstName;
    @XmlElement(name = "EmbossedLastName",namespace = "http://www.openwaygroup.com/wsint")
    String  embossedLastName;
    @XmlElement(name = "EmbossedCompanyName",namespace = "http://www.openwaygroup.com/wsint")
    String  embossedCompanyName;
}
