package com.backend.smartwalletapp.dto.request.Card;

import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
@Getter
public class LockOrUnLockCardRequest {
    boolean newStatus;
}
