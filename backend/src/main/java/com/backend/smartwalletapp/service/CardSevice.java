package com.backend.smartwalletapp.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.client.service.CardSoapService;
import com.backend.smartwalletapp.dto.response.Card.CreateCardReponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;

import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;


@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)

public class CardSevice {
    CardSoapService cardSoapService;

    // public Card LockUnlockCard(String contractId, LockOrUnLockCardRequest request){
    //     try {
    //         LockOrUnLockCardSoapResponse response = cardSoapService.LockOrUnLock(contractId, request.isNewStatus());
    //         Card card = response.getCard();
    //         return card;
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new AppException(ErrorCode.LOCK_UNLOCK_CARD_FAILE);
    //     }
    // }

    public CreateCardV3Result createCardV3(CreateCardV3 request){
        try {
            CreateCardV3Result response = cardSoapService.createCard(request);
            return response;
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CARD_FAILLE);
        }
    }
}