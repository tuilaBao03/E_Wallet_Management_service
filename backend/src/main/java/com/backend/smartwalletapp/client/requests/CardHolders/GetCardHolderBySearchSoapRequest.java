package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;

@XmlRootElement(name = "GetUsersRequest",namespace = "http://www.openwaygroup.com/wsint")
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GetCardHolderBySearchSoapRequest {
    @XmlElement(name = "search")
    String search;
    @XmlElement(name = "page")
    int page;
}
