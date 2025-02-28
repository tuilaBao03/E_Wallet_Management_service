package com.backend.smartwalletapp.model;

import java.sql.Timestamp;
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
    private String cardHolderId;
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
    private Timestamp createdDate;
    private Timestamp updateDate;
    private boolean status;
}
