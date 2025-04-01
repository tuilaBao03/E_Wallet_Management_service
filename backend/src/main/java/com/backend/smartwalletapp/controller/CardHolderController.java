package com.backend.smartwalletapp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.client.requests.CardHolders.create.CreateClientV4Body;
import com.backend.smartwalletapp.client.requests.CardHolders.edit.EditClientV6;
import com.backend.smartwalletapp.client.requests.Contract.Edit.EditContractV4;
import com.backend.smartwalletapp.client.responses.CardHolders.createRes.CreateClientV4Result;
import com.backend.smartwalletapp.dto.request.CardHolder.CreateCardHolder.CardHolderCreatedRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.CardHolder.CreateCardHolderResponse;
import com.backend.smartwalletapp.dto.response.CardHolder.GetCardHolder.CardHolderByPageAndSearch;
import com.backend.smartwalletapp.dto.response.CardHolder.GetCardHolder.GetCardHolderResponse;
import com.backend.smartwalletapp.service.CardHolderService;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.experimental.FieldDefaults;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;

@RestController
@RequestMapping("/smartwalletapp/cardholder")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor

public class CardHolderController {
    CardHolderService cardHolderService;
    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<CreateClientV4Result > createCardHolder(@RequestBody @Valid CreateClientV4Body request){
        CreateClientV4Result  createCardHolderResponse = cardHolderService.createCardHolder(request);
        String mess = createCardHolderResponse.getRetMsg();
        int code = createCardHolderResponse.getRetCode();
        return ApiResponse.<CreateClientV4Result>builder()
            .result(createCardHolderResponse)
            .code(code)
            .message(mess).build();
    }
    @GetMapping
    @PreAuthorize("hasRole(T(com.example.constants.Roles).USER.name()) or hasRole(T(com.example.constants.Roles).ADMIN.name())")
    public ApiResponse<CardHolderByPageAndSearch> getAllCardHolder(
            @RequestParam(required = false, defaultValue = "") String search,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) { // Default limit = 10 nếu không truyền
        CardHolderByPageAndSearch cardHolderResponse = cardHolderService.getCardHolders(page, search, size);
        
        return ApiResponse.<CardHolderByPageAndSearch>builder()
            .result(cardHolderResponse)
            .code(200)
            .message("ok")
            .build();
    }


    @PutMapping("/edit")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse edit_contract(@RequestBody @Valid EditClientV6 request){
        return ApiResponse.builder()
        .result(cardHolderService.editCardholder(request))
        .code(200)
        .build();
    }



    



    
    


    
    
    

    



    
    
    
    
}
