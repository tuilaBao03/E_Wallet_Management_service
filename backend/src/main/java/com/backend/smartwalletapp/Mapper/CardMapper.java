package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.requests.Card.create.InObject;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.dto.request.Card.CreateCardRequest;
import com.backend.smartwalletapp.dto.response.Card.CreateCardReponse;

@Mapper(componentModel = "spring")
public interface CardMapper {

    CardMapper INSTANCE = Mappers.getMapper(CardMapper.class);
    
    InObject toInObject(CreateCardRequest request);
    default CreateCardV3 maptoCreateCardV3(CreateCardRequest request) {
        return CreateCardV3.builder()
                .contractSearchMethod(request.getContractSearchMethod())
                .contractIdentifier(request.getContractIdentifier())
                .productCode(request.getProductCode())
                .productCode2(request.getProductCode2())
                .productCode3(request.getProductCode3())
                .inObject(toInObject(request))
                .build();
    }

    CreateCardReponse maptoCreateCardReponse(CreateCardV3Result response);
}
