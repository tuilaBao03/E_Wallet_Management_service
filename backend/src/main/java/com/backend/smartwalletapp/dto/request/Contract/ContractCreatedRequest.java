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
    String note;
    String url;
    String parentContract;
    String cardHolderID;
    boolean typeContract;
}
