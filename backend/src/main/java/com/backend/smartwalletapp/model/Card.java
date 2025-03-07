package com.backend.smartwalletapp.model;

import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Card {
    String cardId;
    String cardName;
    String contractId;
    String typeCard;
    BigDecimal amount;
    BigDecimal limit;
}
