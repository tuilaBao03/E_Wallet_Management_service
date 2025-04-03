package com.backend.smartwalletapp.client.responses.Card.setState;


import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)

@XmlRootElement(name = "ActivateCardResult",namespace = "http://www.openwaygroup.com/wsint")
public class ActivateCardResult{

    @XmlElement(name = "RetCode", namespace = "http://www.openwaygroup.com/wsint")
    int retCode;

    @XmlElement(name = "RetMsg", namespace = "http://www.openwaygroup.com/wsint")
    String retMsg;

    @XmlElement(name = "ResultInfo", namespace = "http://www.openwaygroup.com/wsint")
    String ressultInfo;

}
