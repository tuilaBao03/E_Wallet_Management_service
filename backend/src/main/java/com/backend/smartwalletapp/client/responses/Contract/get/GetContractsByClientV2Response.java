package com.backend.smartwalletapp.client.responses.Contract.get;

import jakarta.xml.bind.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;


@XmlRootElement(name = "GetContractsByClientV2Response", namespace = "http://www.openwaygroup.com/wsint")
@XmlAccessorType(XmlAccessType.FIELD)
@Getter
@Setter
@Data
@AllArgsConstructor
@Builder
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

public class GetContractsByClientV2Response {
    @XmlElement(name = "GetContractsByClientV2Result",namespace = "http://www.openwaygroup.com/wsint")
    private GetContractsByClientV2Result result;
}

