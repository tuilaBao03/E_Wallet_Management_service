package com.backend.smartwalletapp.controller;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.dto.request.Contract.ContractCreatedRequest;
import com.backend.smartwalletapp.dto.request.Contract.LockUnLockContracRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.model.Contract;
import com.backend.smartwalletapp.service.ContractService;

import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@RestController
@RequestMapping("/smartwalletapp/contract")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ContractController {
    ContractService contractService;
    @PostMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<Contract> createContract(@RequestBody @Valid ContractCreatedRequest request){
        return ApiResponse.<Contract>builder()
            .result(contractService.createContract(request))
            .code(200)
            .message("Create contract successed").build();
    };

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<Contract> LockUnLockContract(
        @PathVariable String id,
        @RequestBody @Valid LockUnLockContracRequest request){
        return ApiResponse.<Contract>builder()
        .result(contractService.LockUnlockContract(id, request))
        .code(200)
        .build();
    }

    @GetMapping()
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    public Page<Contract> getContractPage(@RequestParam(defaultValue = "0") int page,
                               @RequestParam(defaultValue = "5") int size) {
        return contractService.getContractPage(page, size);
    }

    
}
