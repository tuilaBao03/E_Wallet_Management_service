package com.backend.smartwalletapp.dto.request.CardHolder;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level=AccessLevel.PRIVATE)
public class CardHolderUpdatedRequest {
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
