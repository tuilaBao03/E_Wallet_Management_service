package com.backend.smartwalletapp.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.client.requests.Card.ActivateCard;
import com.backend.smartwalletapp.client.requests.Card.SetCardStatus;
import com.backend.smartwalletapp.client.requests.Card.create.CreateCardV3;
import com.backend.smartwalletapp.client.responses.Card.create.CreateCardV3Result;
import com.backend.smartwalletapp.client.responses.Card.setState.ActivateCardResult;
import com.backend.smartwalletapp.client.responses.Card.setState.SetCardStatusResult;
import com.backend.smartwalletapp.client.service.CardSoapService;
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
    CardSoapService cardSoapService;
    CardSevice cardService;   


    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public CreateCardV3Result createCard(
        @RequestBody @Valid CreateCardV3 request){
        return cardService.createCardV3(request);
    }


    @PatchMapping("/status")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public SetCardStatusResult SetCardStatus(
        @RequestBody @Valid SetCardStatus request){
        return cardSoapService.setCardStatus(request);
    }

    @PatchMapping("/activate")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ActivateCardResult activateCard(
        @RequestBody @Valid ActivateCard request){
        return cardSoapService.activateCard(request);
    }
   
}
