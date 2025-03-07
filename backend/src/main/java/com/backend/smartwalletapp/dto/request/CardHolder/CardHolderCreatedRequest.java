package com.backend.smartwalletapp.dto.request.CardHolder;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CardHolderCreatedRequest {
    String clientSearchMethod = "CLIENT_NUMBER"; // Thêm mặc định
    String clientIdentifier;  // Thay phoneNumber -> clientIdentifier cho đúng SOAP
    String reason;
    
    // Nhóm dữ liệu vào CreateContract_InObject
    String branch;
    String institutionCode;
    String productCode;
    String productCode2;
    String productCode3;
    String contractName;
    String cbsNumber;
}