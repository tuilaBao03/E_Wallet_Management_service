package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;

import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.model.Contract;

@Mapper(componentModel = "spring")
public interface ContractMapper {
    Contract toCreateContract(ContractCreatedRequest request);

}
