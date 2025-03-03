package com.backend.smartwalletapp.dto.request.Contract;

import java.math.BigDecimal;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Getter
@Setter
@AllArgsConstructor
@Data
public class UpdateLimitContractRequest {
    BigDecimal newLimit;
}
