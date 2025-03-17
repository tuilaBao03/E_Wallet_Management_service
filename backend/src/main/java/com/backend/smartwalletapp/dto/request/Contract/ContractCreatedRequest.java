package com.backend.smartwalletapp.dto.request.Contract;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ContractCreatedRequest {
    String reason; // map to <wsin:Reason>
    String clientIdentifier;
    String clientSearchMethod; // map to <wsin:ClientSearchMethod>
    
    String branch; // map to <wsin:Branch>
    String institutionCode; // map to <wsin:InstitutionCode>
    String productCode; // map to <wsin:ProductCode>
    String productCode2; // map to <wsin:ProductCode2>
    String productCode3; // map to <wsin:ProductCode3>
    String contractName; // map to <wsin:ContractName>
    String cbsNumber; // map to <wsin:CBSNumber>
    String customData; // map to <wsin:SetCustomData_InObject> nếu có dữ liệu động
}
