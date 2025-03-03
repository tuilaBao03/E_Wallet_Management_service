package com.backend.smartwalletapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.backend.smartwalletapp.client.responses.Transaction.GetTransactionByContractSoapResponse;
import com.backend.smartwalletapp.client.service.TransactionSoapService;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.Transaction;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TransactionService {
    TransactionSoapService transactionSoapService;
    public List<Transaction> getTransactionByContract(String contractId){
        try {
            GetTransactionByContractSoapResponse response = transactionSoapService.getTransactionByContractSoap(contractId); 

            List<Transaction> transactions = response.getTranList();
            return transactions;
        } catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.GET_TRAN_FAILLE);
        }
    }
}
