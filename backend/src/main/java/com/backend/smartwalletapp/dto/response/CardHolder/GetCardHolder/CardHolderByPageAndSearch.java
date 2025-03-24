package com.backend.smartwalletapp.dto.response.CardHolder.GetCardHolder;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class CardHolderByPageAndSearch {
    int page;
    int pageAmount;
    List<GetCardHolderResponse> cardholders;
}
