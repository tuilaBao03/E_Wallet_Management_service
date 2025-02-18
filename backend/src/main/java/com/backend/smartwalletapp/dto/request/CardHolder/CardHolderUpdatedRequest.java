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
    String phoneNumber;
    String homeAddress;
    String companyAddress;
    String lastName;
    String firstName;
    String avatar;
    String email;
}
