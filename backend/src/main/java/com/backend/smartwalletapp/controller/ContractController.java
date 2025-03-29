package com.backend.smartwalletapp.controller;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.backend.smartwalletapp.client.requests.Contract.CreateContractLevel2.CreateContractV4_REQV2;
import com.backend.smartwalletapp.client.requests.Contract.CreateContractV4.CreateContractV4_REQ;
import com.backend.smartwalletapp.client.requests.Contract.Edit.EditContractV4;
import com.backend.smartwalletapp.client.responses.Contract.create.CreateContractV4Result;
import com.backend.smartwalletapp.client.responses.Contract.get.IssContractDetailsAPIOutputV2Record;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.Contract.CreateContractReponse;
import com.backend.smartwalletapp.dto.response.Contract.GetContract.ContractListResponse;
import com.backend.smartwalletapp.service.ContractService;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;


@RestController
@RequestMapping("/smartwalletapp/contracts")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractController {
    ContractService contractService;
    @GetMapping("/search")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<ContractListResponse>> getAllContracts(
        @RequestParam(required = false, defaultValue = "") String query,
        @RequestParam(required = false, defaultValue = "0") int page,
        @RequestParam(required = false, defaultValue = "10") int count
    ) {
        return ApiResponse.<List<ContractListResponse>>builder()
            .result(contractService.giveContractBySearchAndPage(query, page, count))
            .code(200)
            .build();
    }

    @GetMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<List<IssContractDetailsAPIOutputV2Record>> getContractByIdentifier(
        @RequestParam String identifier, 
        @RequestParam String type) {

        if ("ByClientID".equalsIgnoreCase(type)) {
            return contractService.GetContracts_ClientIdentifier(identifier);
        } else if ("ByCardNumber".equalsIgnoreCase(type)) {
            return contractService.GetContracts_ContractNumber(identifier);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid type parameter");
        }
    }

    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<CreateContractV4Result> CreateContractV4_parent(@RequestBody @Valid CreateContractV4_REQ request){
        return ApiResponse.<CreateContractV4Result >builder()
        .result(contractService.createContract(request))
        .code(200)
        .message("null")
        .build();
    }

    @PostMapping("/children")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public ApiResponse<CreateContractV4Result > CreateContractV4_children(@RequestBody @Valid CreateContractV4_REQV2 request){
        return ApiResponse.<CreateContractV4Result>builder()
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
