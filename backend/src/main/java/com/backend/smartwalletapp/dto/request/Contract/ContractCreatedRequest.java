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
    String note; // map to <wsin:Reason>
    String url; // có thể dùng cho custom hoặc file đính kèm
    String parentContract; // có thể map vào SetCustomData_InObject nếu cần
    String cardHolderID; // map to <wsin:ClientIdentifier>
    boolean typeContract; // để xét loại hợp đồng (có thể dùng logic để map)
    // Các trường cần thêm
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
