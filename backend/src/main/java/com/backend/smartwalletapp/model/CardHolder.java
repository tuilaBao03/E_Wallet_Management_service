package com.backend.smartwalletapp.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CardHolder {

    private String institutionCode;
    private String branch;
    private String clientTypeCode;
    private String clientCategory;
    private String serviceGroup;
    private String productCategory;
    private String languageCode;
    private String salutationSuffix;
    private String shortName;
    private String firstName;
    private String lastName;
    private String middleName;
    private String maritalStatusCode;
    private String socialSecurityNumber;
    private String salutationCode;
    private String birthDate; // Có thể dùng LocalDate nếu muốn kiểu chuẩn cho ngày tháng
    private String gender;
    private String birthPlace;
    private String birthName;
    private String citizenship;
    private String taxBracket;
    private String individualTaxpayerNumber;
    private String secretPhrase;
    private String companyName;
    private String trademark;
    private String department;
    private String embossedTitleCode;
    private String embossedFirstName;
    private String embossedLastName;
    private String embossedCompanyName;
    private String identityCardType;
    private String identityCardNumber;
    private String identityCardDetails;
    private String clientNumber;
    private String profession;
    private String email;
    private String addressLine1;
    private String addressLine2;
    private String addressLine3;
    private String addressLine4;
    private String city;
    private String homePhone;
    private String mobilePhone;
    private String businessPhone;

}
