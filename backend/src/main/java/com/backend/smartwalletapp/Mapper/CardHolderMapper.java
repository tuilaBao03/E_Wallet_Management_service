package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;


import com.backend.smartwalletapp.client.requests.CardHolders.CreateCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.LockUnlockStatusCardHolderRequest;


@Mapper(componentModel = "spring")
public interface CardHolderMapper {
    CardHolderMapper INSTANCE = Mappers.getMapper(CardHolderMapper.class);

    @Mapping(source = "clientSearchMethod", target = "clientSearchMethod")
    @Mapping(source = "clientIdentifier", target = "clientIdentifier")
    @Mapping(source = "reason", target = "reason")
    @Mapping(source = "branch", target = "createContractInObject.branch")
    @Mapping(source = "institutionCode", target = "createContractInObject.institutionCode")
    @Mapping(source = "productCode", target = "createContractInObject.productCode")
    @Mapping(source = "productCode2", target = "createContractInObject.productCode2")
    @Mapping(source = "productCode3", target = "createContractInObject.productCode3")
    @Mapping(source = "contractName", target = "createContractInObject.contractName")
    @Mapping(source = "cbsNumber", target = "createContractInObject.cbsNumber")
    CreateCardHolderSoapRequest toSoapRequest(CardHolderCreatedRequest request);
    LockOrUnlockCardHolderSoapRequest toStatusCardHolderSoapRequest(LockUnlockStatusCardHolderRequest request);
}