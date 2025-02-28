package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;

import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;

@Mapper(componentModel = "spring")
public interface ContractMapper {

    LockOrUnlockCardHolderSoapRequest toSoapStatusRequest(LockOrUnlockCardHolderSoapRequest request);
    
}
