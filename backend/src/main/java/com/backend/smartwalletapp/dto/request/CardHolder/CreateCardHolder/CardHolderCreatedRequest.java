package com.backend.smartwalletapp.dto.request.CardHolder.CreateCardHolder;

import java.time.LocalDate;
import java.util.List;

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
    String reason;
    String institutionCode;
    String branch;
    String clientTypeCode;
    String clientCategory;
    String serviceGroup;
    String productCategory;
    String languageCode;
    String salutationSuffix;
    String shortName;
    String firstName;
    String lastName;
    String middleName;
    String maritalStatusCode;
    String socialSecurityNumber;
    String salutationCode;
    LocalDate birthDate;
    String gender;
    String birthPlace;
    String birthName;
    String citizenship;
    String taxBracket;
    String individualTaxpayerNumber;
    String secretPhrase;
    String companyName;
    String trademark;
    String department;
    String embossedTitleCode;
    String embossedFirstName;
    String embossedLastName;
    String embossedCompanyName;
    String identityCardType;
    String identityCardNumber;
    String identityCardDetails;
    String clientNumber;
    String profession;
    String eMail;
    String addressLine1;
    String addressLine2;
    String addressLine3;
    String addressLine4;
    String city;
    String homePhone;
    String mobilePhone;
    String businessPhone;
    List<SetCustomDataInObjectJson> customData;

}