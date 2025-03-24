package com.backend.smartwalletapp.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    ApiResponse<CreateCardHolderResponse> createCardHolder(@RequestBody @Valid CardHolderCreatedRequest request){
        CreateCardHolderResponse createCardHolderResponse = cardHolderService.createCardHolder(request);
        String mess = createCardHolderResponse.getRetMsg();
        int code = createCardHolderResponse.getRetCode();
        return ApiResponse.<CreateCardHolderResponse>builder()
            .result(createCardHolderResponse)
            .code(code)
            .message(mess).build();
    }
    @GetMapping("/{search}/{page}")
    @PreAuthorize("hasRole(T(com.example.constants.Roles).USER.name()) or hasRole(T(com.example.constants.Roles).ADMIN.name())")
    public ApiResponse<CardHolderByPageAndSearch> getAllCardHolder(@PathVariable String search, @PathVariable int page) {
        CardHolderByPageAndSearch cardHolderResponse = cardHolderService.getCardHolders(page, search);
        return ApiResponse.<CardHolderByPageAndSearch>builder()
            .result(cardHolderResponse)
            .code(200)
            .message("ok")
            .build();
    }



    



    
    


    
    
    

    



    
    
    
    
}
