package com.backend.smartwalletapp.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.service.CardSevice;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.experimental.FieldDefaults;

@RestController
@RequestMapping("/smartwalletapp/card")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public class CardController {
    CardSevice cardService;   
    // @PatchMapping("/{id}/status")
    // @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    // public ApiResponse<Card> LockUnLockContract(
    //     @PathVariable String id,
    //     @RequestBody @Valid LockOrUnLockCardRequest request){
    //     return ApiResponse.<Card>builder()
    //     .result(cardService.LockUnlockCard(id, request))
    //     .code(200)
    //     .build();
    // }

    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<CreateCardV3Result> createCard(
        @RequestBody @Valid CreateCardV3 request){
        return ApiResponse.<CreateCardV3Result>builder()
        .result(cardService.createCardV3(request))
        .code(200)
        .message("ok")
        .build();
    }
   
}
