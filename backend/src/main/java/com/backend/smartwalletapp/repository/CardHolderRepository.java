package com.backend.smartwalletapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.smartwalletapp.model.CardHolder;

public interface CardHolderRepository extends JpaRepository<CardHolder, String> {
    
}
