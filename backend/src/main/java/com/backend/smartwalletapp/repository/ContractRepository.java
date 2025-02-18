package com.backend.smartwalletapp.repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.smartwalletapp.model.Contract;

public interface ContractRepository extends JpaRepository<Contract,String>{
    @SuppressWarnings("null")
    boolean existsById(String id);
    Contract findByContractID(String contractID);
    @SuppressWarnings("null")
    Page<Contract> findAll(Pageable pageable);
}
