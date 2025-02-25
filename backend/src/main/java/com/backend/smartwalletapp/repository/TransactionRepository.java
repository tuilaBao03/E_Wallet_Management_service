package com.backend.smartwalletapp.repository;

import org.springframework.data.domain.Page;

import com.backend.smartwalletapp.model.Transaction;

public interface TransactionRepository {
    boolean existsById(String id);
    Transaction findbyTransactionID(String id);
    Page<Transaction> findAll(Package pageable);
    
}
