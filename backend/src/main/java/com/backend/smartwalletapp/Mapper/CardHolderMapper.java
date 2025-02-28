package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;


import com.backend.smartwalletapp.client.requests.CardHolders.CreateCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.LockUnlockStatusCardHolderRequest;


@Mapper(componentModel = "spring")
public interface CardHolderMapper {
    CreateCardHolderSoapRequest toSoapRequest(CardHolderCreatedRequest request);
    LockOrUnlockCardHolderSoapRequest toStatusCardHolderSoapRequest(LockUnlockStatusCardHolderRequest request);
}