package com.backend.smartwalletapp.dto.response.Card;


import lombok.experimental.FieldDefaults;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import com.backend.smartwalletapp.model.Card;



@FieldDefaults(level = AccessLevel.PRIVATE)
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class LockOrUnlockCardReponse {
    Card Card;
}
