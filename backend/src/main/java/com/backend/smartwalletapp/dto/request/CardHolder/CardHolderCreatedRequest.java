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
    private String phoneNumber;
    private String homeAddress;
    private String companyAddress;
    private String lastName;
    private String firstName;
    private String avatar;
    private String email;
    private String Reason;
    private String ClientTypeCode;
    private String InstitutionCode;
    private String Branch;
    private String ClientCategory;
    private String ProductCategory;
    private String ShortName;
}
