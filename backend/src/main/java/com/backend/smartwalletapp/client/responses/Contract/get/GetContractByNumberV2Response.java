package com.backend.smartwalletapp.client.responses.Contract.get;
import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@XmlAccessorType(XmlAccessType.FIELD)

@Data
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@XmlRootElement(name = "GetContractByNumberV2Response", namespace = "http://www.openwaygroup.com/wsint")
public class GetContractByNumberV2Response {

    @XmlElement(name = "GetContractByNumberV2Result",namespace = "http://www.openwaygroup.com/wsint")
    GetContractByNumberV2Result result;
}
