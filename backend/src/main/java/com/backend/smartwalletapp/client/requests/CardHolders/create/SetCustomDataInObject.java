package com.backend.smartwalletapp.client.requests.CardHolders.create;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class SetCustomDataInObject {

    @XmlElement(name = "AddInfoType", namespace = "http://www.openwaygroup.com/wsint")
    private String addInfoType;

    @XmlElement(name = "TagName", namespace = "http://www.openwaygroup.com/wsint")
    private String tagName;

    @XmlElement(name = "TagValue", namespace = "http://www.openwaygroup.com/wsint")
    private String tagValue;
}
