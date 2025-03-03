package com.backend.smartwalletapp.model;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

import com.backend.smartwalletapp.enums.TransactionStatus;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Transaction {
    private String transactionID;
    private double amount;
    private TransactionStatus status;
    private String note;
    Timestamp createdDate;
    Timestamp updatedDate;
}
