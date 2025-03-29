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
    String contractNumber;
    String branch;
    String SERVICE_GROUP;
    String contractName;
    String contractLevel;
    String billingContract;
    String parentProduct;
    String productCode;
    String liabilityContract;
    List<ContractBySearchAndPage> contract;

    
}
