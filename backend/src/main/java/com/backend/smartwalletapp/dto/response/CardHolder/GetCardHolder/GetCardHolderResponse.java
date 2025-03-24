package com.backend.smartwalletapp.dto.response.CardHolder.GetCardHolder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class GetCardHolderResponse {
    private int id;
    private String branch;
    private String shortName;
    private String firstName;
    private String lastName;
    private String gender;
    private String clientNumber;
    private String regNumber;
    private String itn;
    private String socialNumber;
    private String phone;
    private String email;
}
