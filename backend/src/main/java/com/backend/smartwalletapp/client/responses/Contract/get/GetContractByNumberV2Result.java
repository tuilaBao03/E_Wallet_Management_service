package com.backend.smartwalletapp.client.responses.Contract.get;

import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@XmlAccessorType(XmlAccessType.FIELD)
@Data
@AllArgsConstructor
@Builder
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@XmlRootElement(name = "GetContractByNumberV2Result", namespace = "http://www.openwaygroup.com/wsint")
public class GetContractByNumberV2Result {

    @XmlElement(name = "RetCode", namespace = "http://www.openwaygroup.com/wsint")
    int retCode;

    @XmlElement(name = "ResultInfo",namespace = "http://www.openwaygroup.com/wsint")
    String resultInfo;

    @XmlElement(name = "OutObject", namespace = "http://www.openwaygroup.com/wsint")
    OutObject outObject;
}

