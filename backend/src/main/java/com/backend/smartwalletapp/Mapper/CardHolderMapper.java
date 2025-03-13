package com.backend.smartwalletapp.Mapper;

import java.util.List;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import com.backend.smartwalletapp.client.requests.CardHolders.LockOrUnlockCardHolderSoapRequest;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientInObject;
import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.CardHolders.create.SetCustomDataInObject;
import com.backend.smartwalletapp.client.requests.CardHolders.create.SoapBody;
import com.backend.smartwalletapp.dto.request.CardHolder.LockUnlockStatusCardHolderRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.CreateCardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.CreateCardHolder.SetCustomDataInObjectJson;


@Mapper(componentModel = "spring")
public interface CardHolderMapper {

    CardHolderMapper INSTANCE = Mappers.getMapper(CardHolderMapper.class);

    LockOrUnlockCardHolderSoapRequest toStatusCardHolderSoapRequest(LockUnlockStatusCardHolderRequest request);

    CreateClientInObject toCreateClientInObject(CardHolderCreatedRequest request);

    List<SetCustomDataInObject> toSetCustomDataInObject(List<SetCustomDataInObjectJson> customData);

    default CreateClientV4Body toCreateClientV4Body(CardHolderCreatedRequest request) {
        return CreateClientV4Body.builder()
                .reason(request.getReason())
                .createClientInObject(toCreateClientInObject(request))
                .setCustomDataInObjects(toSetCustomDataInObject(request.getCustomData()))
                .build();
    }

}
