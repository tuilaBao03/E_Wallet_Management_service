package com.backend.smartwalletapp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.dto.request.CardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.request.CardHolder.LockUnlockStatusCardHolderRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.CardHolder.CardHolderResponse;
import com.backend.smartwalletapp.model.CardHolder;
import com.backend.smartwalletapp.model.Contract;
import com.backend.smartwalletapp.service.CardHolderService;
import com.backend.smartwalletapp.service.ContractService;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("/smartwalletapp/cardholder")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor

public class CardHolderController {
    CardHolderService cardHolderService;
    ContractService contractService;
    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<CardHolder> createCardHolder(@RequestBody @Valid CardHolderCreatedRequest request){
        return ApiResponse.<CardHolder>builder()
            .result(cardHolderService.createCardHolder(request))
            .code(200)
            .message("cardholder success").build();
    }

    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    @GetMapping("/{search}/{page}/{size}")
    ApiResponse<CardHolderResponse> getAllCardHolderBySearch(
        @PathVariable String search,
        @PathVariable int page,
        @PathVariable int size
    ){
        return ApiResponse.<CardHolderResponse>builder()
            .result(cardHolderService.getCardHolders(search, page, size))
            .code(200)
            .message("all cardholder ").build();
    }

    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    @GetMapping("/{id}/contracts")
    ApiResponse<List<Contract>> getCOntractByCardHolderBySearch(
        @PathVariable String id
    ){
        return ApiResponse.<List<Contract>>builder()
            .result(contractService.giveContractByCardHolder(id))
            .code(200)
            .message("all cardholder ").build();
    }

    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    @PatchMapping("/{id}")
    ApiResponse<CardHolder> LockUnLockCardHolder(
        @PathVariable String id,
        @RequestBody @Valid LockUnlockStatusCardHolderRequest request){
        return ApiResponse.<CardHolder>builder()
            .result(cardHolderService.updateStatusCardHolder(id,request ))
            .message("CardHolder status was updated")
            .code(200).build();
    }


    
    


    
    
    

    



    
    
    
    
}
