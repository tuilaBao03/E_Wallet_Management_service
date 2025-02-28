package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;

@XmlRootElement(name = "GetUsersRequest")
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
