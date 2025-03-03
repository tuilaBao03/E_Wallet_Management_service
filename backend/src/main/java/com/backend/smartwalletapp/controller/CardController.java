package com.backend.smartwalletapp.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.dto.request.Card.LockOrUnLockCardRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.model.Card;
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
    @PatchMapping("/{id}/status")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<Card> LockUnLockContract(
        @PathVariable String id,
        @RequestBody @Valid LockOrUnLockCardRequest request){
        return ApiResponse.<Card>builder()
        .result(cardService.LockUnlockCard(id, request))
        .code(200)
        .build();
    }
   
}
