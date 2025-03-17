package com.backend.smartwalletapp.dto.response.CardHolder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateCardHolderResponse {
    String newClient;
    String applicationNumber;
    int retCode;
    String retMsg;
    String resultInfo;
}
