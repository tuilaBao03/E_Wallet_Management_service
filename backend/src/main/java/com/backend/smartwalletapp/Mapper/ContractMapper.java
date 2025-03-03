package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;

import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.dto.request.Contract.LockUnLockContracRequest;

@Mapper(componentModel = "spring")
public interface ContractMapper {

    LockOrUnlockCardHolderSoapRequest toSoapStatusRequest(LockUnLockContracRequest request);
    
}
