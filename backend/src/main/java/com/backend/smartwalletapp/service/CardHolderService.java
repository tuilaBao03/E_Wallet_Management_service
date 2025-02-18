package com.backend.smartwalletapp.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
import org.springframework.stereotype.Service;

import com.backend.smartwalletapp.Mapper.CardHolderMapper;
import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderUpdatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.LockUnlockStatusCardHolderRequest;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.CardHolder;
import com.backend.smartwalletapp.repository.CardHolderRepository;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@Service

@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class CardHolderService {
    CardHolderRepository cardHolderRepository;
    CardHolderMapper cardHolderMapper;

    public CardHolder createCardHolder(CardHolderCreatedRequest request){
        try{
            CardHolder cardHolder = cardHolderMapper.toCreatedCardHolder(request);
            cardHolder.setStatus(true);
            cardHolder.setCreatedDate(Timestamp.from(Instant.now()));
            cardHolder.setUpdateDate(Timestamp.from(Instant.now()));
            return cardHolderRepository.save(cardHolder);
        }
        catch( Exception e){
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
    public CardHolder updateStatusCardHolder(String id,LockUnlockStatusCardHolderRequest request){
        try{
            if(!cardHolderRepository.existsById(id)){
                throw new AppException(ErrorCode.CARDHOLDER_NOT_EXISTS);
            }
            CardHolder cardHolder = cardHolderRepository.findByCardHolderId(id);
            cardHolder.setStatus(request.isNewStatus());
            cardHolder.setUpdateDate(Timestamp.from(Instant.now()));
            return cardHolderRepository.save(cardHolder);  
        }
        catch(Exception e){
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
    public List<CardHolder> getAllCardHolder(){
        return cardHolderRepository.findAll();
    }
    public CardHolder getCardHolderbyID(String id){
        return cardHolderRepository.findByCardHolderId(id);
    }

    public CardHolder updateCardHolder(String id, CardHolderUpdatedRequest request){
        if(!cardHolderRepository.existsById(id)){
            throw new AppException(ErrorCode.CARDHOLDER_NOT_EXISTS);
        }
        CardHolder cardHolder = cardHolderRepository.findByCardHolderId(id);
        cardHolderMapper.updateCardHolderFromRequest(request, cardHolder);
        cardHolder.setUpdateDate(Timestamp.from(Instant.now()));
        return cardHolderRepository.save(cardHolder);
    }
}
