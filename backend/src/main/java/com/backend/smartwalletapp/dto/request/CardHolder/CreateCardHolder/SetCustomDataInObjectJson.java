package com.backend.smartwalletapp.dto.request.CardHolder.CreateCardHolder;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;

@Data
@RequiredArgsConstructor
@FieldDefaults (level = AccessLevel.PRIVATE, makeFinal = true)
public class SetCustomDataInObjectJson {
    String addInfoType;
    String tagName;
    String tagValue;
}
