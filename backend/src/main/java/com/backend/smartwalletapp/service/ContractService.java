package com.backend.smartwalletapp.service;

import java.sql.Timestamp;
import java.time.Instant;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import com.backend.smartwalletapp.Mapper.ContractMapper;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.LockUnLockContracRequest;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.CardHolder;
import com.backend.smartwalletapp.model.Contract;
import com.backend.smartwalletapp.repository.CardHolderRepository;
import com.backend.smartwalletapp.repository.ContractRepository;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractService {
    ContractMapper contractMapper;
    ContractRepository contractRepository;
    CardHolderRepository cardHolderRepository;
    
    public Contract createContract(ContractCreatedRequest request){
        try {
            Contract contract = contractMapper.toCreateContract(request);
            contract.setCreatedDate(Timestamp.from(Instant.now()));
            contract.setUpdatedDate(Timestamp.from(Instant.now()));
            contract.setStatus(true);
            System.err.println(request.getCardHolderID());
            if(!cardHolderRepository.existsById(request.getCardHolderID())){
                throw new AppException(ErrorCode.CARDHOLDER_NOT_FOUND);
            }
            CardHolder cardHolder = cardHolderRepository.findByCardHolderId(request.getCardHolderID());
            contract.setCardHolder(cardHolder);
            return contractRepository.save(contract);
        } catch (AppException e) {
            throw e; 
        }
        catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.CREATE_CONTRACT_FAILE);
        }
    }
    public Contract LockUnlockContract(String id,LockUnLockContracRequest request){
        try {
            if(contractRepository.existsById(id)){
                throw new AppException(ErrorCode.CONTRACT_NOT_EXISTS);
            }
            Contract contract = contractRepository.findByContractID(id);
            contract.setStatus(request.isNewStatus());
            return contractRepository.save(contract);
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.LOCK_UNLOCK_FAILE);
        }
    }
    public Page<Contract> getContractPage(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return contractRepository.findAll(pageable);
    }
}
