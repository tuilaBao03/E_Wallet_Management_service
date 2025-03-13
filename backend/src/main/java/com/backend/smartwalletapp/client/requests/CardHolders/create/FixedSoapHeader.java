package com.backend.smartwalletapp.client.requests.CardHolders.create;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "Header", namespace = "http://schemas.xmlsoap.org/soap/envelope/")
@Builder
public class FixedSoapHeader {

    @XmlElement(name = "SessionContextStr", namespace = "http://www.openwaygroup.com/wsint", required = true)
    private String sessionContextStr;

    @XmlElement(name = "UserInfo", namespace = "http://www.openwaygroup.com/wsint", required = true)
    private String userInfo;

    @XmlElement(name = "CorrelationId", namespace = "http://www.openwaygroup.com/wsint", required = true)
    private String correlationId;
}
