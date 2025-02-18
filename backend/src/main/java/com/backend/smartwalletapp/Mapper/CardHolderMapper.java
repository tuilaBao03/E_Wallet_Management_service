package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderUpdatedRequest;
import com.backend.smartwalletapp.model.CardHolder;

@Mapper(componentModel = "spring")
public interface CardHolderMapper {
    CardHolder toCreatedCardHolder(CardHolderCreatedRequest request);
    void updateCardHolderFromRequest(CardHolderUpdatedRequest request, @MappingTarget CardHolder cardHolder);
}
