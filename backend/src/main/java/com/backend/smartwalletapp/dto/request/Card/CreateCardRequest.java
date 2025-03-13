package com.backend.smartwalletapp.dto.request.Card;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@Builder
@AllArgsConstructor
public class CreateCardRequest {

    String contractSearchMethod;
    String contractIdentifier;
    String productCode;
    String productCode2;
    String productCode3;
    String cardName;
    String  cbsNumber;
    String  embossedFirstName;
    String  embossedLastName;
    String  embossedCompanyName;
}
