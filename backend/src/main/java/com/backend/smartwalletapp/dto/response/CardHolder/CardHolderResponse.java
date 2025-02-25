package com.backend.smartwalletapp.dto.response.CardHolder;

import java.util.List;

import com.backend.smartwalletapp.model.CardHolder;

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
public class CardHolderResponse {
    int page;
    int pageAmount;
    List<CardHolder> cardHolders;
}
