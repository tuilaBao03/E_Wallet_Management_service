package com.backend.smartwalletapp.controller;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.client.responses.Contract.get.IssContractDetailsAPIOutputV2Record;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequestLevel2;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.model.Card;
import com.backend.smartwalletapp.service.CardSevice;
import com.backend.smartwalletapp.service.ContractService;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.PostMapping;


@RestController
@RequestMapping("/smartwalletapp/contract")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractController {
    ContractService contractService;
    CardSevice cardSevice;
    
    // @PatchMapping("/{id}/status")
    // @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    // public ApiResponse<Contract> LockUnLockContract(
    //     @PathVariable String id,
    //     @RequestBody @Valid LockUnLockContracRequest request){
    //     return ApiResponse.<Contract>builder()
    //     .result(contractService.LockUnlockContract(id, request))
    //     .code(200)
    //     .build();
    // }



    // @PatchMapping("/{id}/Limit")
    // @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    // ApiResponse<Contract> UpdateLimitContract(
    //     @RequestBody @Valid UpdateLimitContractRequest request,
    //     @PathVariable String id
    // ){
    //     return ApiResponse.<Contract>builder()
    //     .result(contractService.updateLimit(id, request.getNewLimit()))
    //         .code(200)
    //         .message("cardholder success").build();
        
    // }


    @PatchMapping("/{id}/cards")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<Card>> GetCardByContract(
        @PathVariable String id){
        return ApiResponse.<List<Card>>builder()
        .result(cardSevice.getCardbyContract(id))
        .code(200)
        .build();
    }

    // @PatchMapping("/{id}/transactions")
    // @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    // public ApiResponse<List<Transaction>> GetTransByContract(
    //     @PathVariable String id){
    //     return ApiResponse.<List<Transaction>>builder()
    //     .result(transactionService.getTransactionByContract(id))
    //     .code(200)
    //     .build();
    // }

    @GetMapping("/ByClient/{clientIdentifier}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<IssContractDetailsAPIOutputV2Record>> GetContractByClient(
        @PathVariable String clientIdentifier){
        return contractService.GetContracts_ClientIdentifier(clientIdentifier);
    };

    @GetMapping("/ByCardNumber/{cardNumber}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<IssContractDetailsAPIOutputV2Record>> GetContractBy(
        @PathVariable String cardNumber){
        return contractService.GetContracts_ContractNumber(cardNumber);
    }

    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<CreateContractReponse> CreateContractV4_parent(@RequestBody @Valid ContractCreatedRequest request){
        return ApiResponse.<CreateContractReponse>builder()
        .result(contractService.createContract(request))
        .code(200)
        .message("null")
        .build();
    }

    @PostMapping("/children")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<CreateContractReponse> CreateContractV4_children(@RequestBody @Valid ContractCreatedRequestLevel2 request){
        return ApiResponse.<CreateContractReponse>builder()
        .result(contractService.createContractV2(request))
        .code(200)
        .build();
    }




    

}
