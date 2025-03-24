package com.backend.smartwalletapp.dto.response.Contract.GetContract;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor

public class ContractBySearchAndPage {
    String CONTRACT_NUMBER;
    String BRANCH;
    String SERVICE_GROUP;
    String CONTRACT_NAME;
    String CONTRACT_LEVEL;
    String BILLING_CONTRACT;
    String PARENT_PRODUCT;
    String PRODUCT;
    String LIAB_CONTRACT;
    List<ContractBySearchAndPage> contracts;

    
}
