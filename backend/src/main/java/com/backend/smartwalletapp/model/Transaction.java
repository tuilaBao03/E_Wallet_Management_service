package com.backend.smartwalletapp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

import com.backend.smartwalletapp.enums.TransactionStatus;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Transaction {
    
    @Id 
    @GeneratedValue(strategy = GenerationType.UUID)
    private String transactionID;
    
    @Column( nullable =  false)
    @NotNull(message = "amount cannot be null")
    private double amount;
    
    @Column( nullable =  false)
    @NotNull(message = "status cannot be null")
    private TransactionStatus status;

    private String note;
    Timestamp createdDate;
    Timestamp updatedDate;

    @ManyToOne
    @JoinColumn(name = "contractID", nullable = false)
    @JsonIgnore
    private Contract contract;


}
