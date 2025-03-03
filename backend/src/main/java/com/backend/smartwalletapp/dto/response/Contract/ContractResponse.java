package com.backend.smartwalletapp.dto.response.Contract;

import java.util.List;

import com.backend.smartwalletapp.model.Contract;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


@AllArgsConstructor

@NoArgsConstructor
public class ContractResponse {
    int page;
    int pageAmount;
    List<Contract> chidrentContract;
    
}
