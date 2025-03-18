package com.backend.smartwalletapp.client.responses.Contract.get;

import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@XmlAccessorType(XmlAccessType.FIELD)
@Getter
@Setter


@Data
@AllArgsConstructor
@Builder
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@XmlRootElement(name = "OutObject", namespace = "http://www.openwaygroup.com/wsint")
public class OutObject {

    @XmlElement(name = "IssContractDetailsAPIOutputV2Record",namespace = "http://www.openwaygroup.com/wsint")
    private List<IssContractDetailsAPIOutputV2Record> contractRecords;
}