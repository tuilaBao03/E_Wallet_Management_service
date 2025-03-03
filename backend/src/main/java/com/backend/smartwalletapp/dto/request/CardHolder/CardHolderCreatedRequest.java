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
    String phoneNumber;
    String homeAddress;
    String companyAddress;
    String lastName;
    String firstName;
    String avatar;
    String email;
    String Reason;
    String ClientTypeCode;
    String InstitutionCode;
    String Branch;
    String ClientCategory;
    String ProductCategory;
    String ShortName;
}
