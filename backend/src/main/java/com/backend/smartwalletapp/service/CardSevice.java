package com.backend.smartwalletapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.smartwalletapp.client.responses.Card.GetCardByContractSoapResponse;
import com.backend.smartwalletapp.client.responses.Card.LockOrUnLockCardSoapResponse;
import com.backend.smartwalletapp.client.service.CardSoapService;
import com.backend.smartwalletapp.dto.request.Card.LockOrUnLockCardRequest;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.Card;

import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;


@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)

public class CardSevice {
    CardSoapService cardSoapService;

    public List<Card> getCardbyContract( String contractId){
        try {
            GetCardByContractSoapResponse response = cardSoapService.getCardByContractSoap(contractId);
            List<Card> cards = response.getCards();
            return cards;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_CARD_FAILLE);
        }
    }
    public Card LockUnlockCard(String contractId, LockOrUnLockCardRequest request){
        try {
            LockOrUnLockCardSoapResponse response = cardSoapService.LockOrUnLock(contractId, request.isNewStatus());
            Card card = response.getCard();
            return card;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.LOCK_UNLOCK_CARD_FAILE);
        }
    }
}
