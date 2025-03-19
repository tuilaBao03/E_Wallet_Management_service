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
class SetCustomData_InObject {

    @XmlElement(name = "AddInfoType", namespace = "http://www.openwaygroup.com/wsint")
    private String addInfoType;

    @XmlElement(name = "RemoveTag", namespace = "http://www.openwaygroup.com/wsint")
    private String removeTag;

    @XmlElement(name = "TagName", namespace = "http://www.openwaygroup.com/wsint")
    private String tagName;

    @XmlElement(name = "TagValue", namespace = "http://www.openwaygroup.com/wsint")
    private String tagValue;
}
