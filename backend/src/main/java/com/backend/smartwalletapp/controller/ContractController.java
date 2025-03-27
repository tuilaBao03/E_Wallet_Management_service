package com.backend.smartwalletapp.controller;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.client.requests.Contract.Edit.EditContractV4;
import com.backend.smartwalletapp.client.responses.Contract.get.IssContractDetailsAPIOutputV2Record;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequestLevel2;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.ContractBySearchAndPage;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.ContractListResponse;
import com.backend.smartwalletapp.model.Card;
import com.backend.smartwalletapp.service.CardSevice;
import com.backend.smartwalletapp.service.ContractService;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;


@RestController
@RequestMapping("/smartwalletapp/contract")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractController {
    ContractService contractService;
    CardSevice cardSevice;



    @PatchMapping("/{id}/cards")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<Card>> GetCardByContract(
        @PathVariable String id){
        return ApiResponse.<List<Card>>builder()
        .result(cardSevice.getCardbyContract(id))
        .code(200)
        .build();
    }

    @GetMapping("/{search}/{page}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<ContractListResponse>> GetAllContract(
        @PathVariable String search, @PathVariable int page
    ){
        return ApiResponse.<List<ContractListResponse>>builder()
        .result(contractService.giveContractBySearchAndPage(search, page))
        .code(200)
        .build();
    }

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

    @PutMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse edit_contract(@RequestBody @Valid EditContractV4 request){
        return ApiResponse.builder()
        .result(contractService.editContract(request))
        .code(200)
        .build();
    }

    
    




    

}
