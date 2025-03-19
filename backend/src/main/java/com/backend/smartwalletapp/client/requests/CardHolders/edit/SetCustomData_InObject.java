package com.backend.smartwalletapp.client.requests.CardHolders.edit;

import jakarta.xml.bind.annotation.XmlElement;

public class SetCustomData_InObject {
    @XmlElement(name = "AddInfoType", namespace = "http://www.openwaygroup.com/wsint")
    private String addInfoType;

    @XmlElement(name = "RemoveTag", namespace = "http://www.openwaygroup.com/wsint")
    private String removeTag;

    @XmlElement(name = "TagName", namespace = "http://www.openwaygroup.com/wsint")
    private String tagName;

    @XmlElement(name = "TagValue", namespace = "http://www.openwaygroup.com/wsint")
    private String tagValue;
}
