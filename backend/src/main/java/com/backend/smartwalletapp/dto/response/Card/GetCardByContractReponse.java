package com.backend.smartwalletapp.dto.response.Card;

import java.util.List;

import com.backend.smartwalletapp.model.Card;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Setter
@AllArgsConstructor
public class GetCardByContractReponse {
    List<Card> ListCard;
}
