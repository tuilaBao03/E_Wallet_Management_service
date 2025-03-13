package com.backend.smartwalletapp.dto.request.Contract;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor

public class ContractCreatedRequestLevel2 {
    String branch;
    String institutionCode;
    String contractName;
    String cbsNumber;
    String addInfo01;
    String addInfo02;
    String liabCategory;
    String liabContractSearchMethod;
    String liabContractIdentifier;
    String clientSearchMethod;
    String clientIdentifier;
    String productCode;
    String productCode2;
    String productCode3;
}
