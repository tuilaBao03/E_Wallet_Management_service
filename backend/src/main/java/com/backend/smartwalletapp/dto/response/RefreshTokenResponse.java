package com.backend.smartwalletapp.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class RefreshTokenResponse {
    private String accessToken;
}
