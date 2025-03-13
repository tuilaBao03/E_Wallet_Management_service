package com.backend.smartwalletapp.client.responses.Contract.create;



import jakarta.xml.bind.annotation.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@AllArgsConstructor
@Builder
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateContractV4Result {

    @XmlElement(name = "CreatedContract", namespace = "http://www.openwaygroup.com/wsint")
    String createdContract;

    @XmlElement(name = "ContractNumber", namespace = "http://www.openwaygroup.com/wsint")
    String contractNumber;

    @XmlElement(name = "ApplicationNumber", namespace = "http://www.openwaygroup.com/wsint")
    String applicationNumber;

    @XmlElement(name = "RetCode", namespace = "http://www.openwaygroup.com/wsint")
    String retCode;

    @XmlElement(name = "RetMsg", namespace = "http://www.openwaygroup.com/wsint")
    String retMsg;

    @XmlElement(name = "ResultInfo", namespace = "http://www.openwaygroup.com/wsint")
    String resultInfo;
}

