package com.backend.smartwalletapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.dto.request.User.UserCreatedRequest;
import com.backend.smartwalletapp.dto.request.User.UserUpdatedRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.model.User;
import com.backend.smartwalletapp.service.UserService;

import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/smartwalletapp/users")
public class UserController {
    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    @PostMapping
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> createRequestUser(@RequestBody @Valid UserCreatedRequest request){
        @SuppressWarnings({ "rawtypes", "unchecked" })
        ApiResponse<User> ApiResponse = new ApiResponse();
        ApiResponse.setCode(200);
        ApiResponse.setMessage("user created successfully");
        ApiResponse.setResult(userService.createUser(request));
        return ApiResponse;
    }

    @GetMapping
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<List<User>> getUser(){
        var authentication =  SecurityContextHolder.getContext().getAuthentication();
        log.info("Username: {}",authentication.getName());
        authentication.getAuthorities().forEach(grantedAuthority -> log.info(grantedAuthority.getAuthority()));
        @SuppressWarnings({ "rawtypes", "unchecked" })
        ApiResponse<List<User>> ApiResponse = new ApiResponse();
        ApiResponse.setCode(200);
        ApiResponse.setMessage("User fetched successfully");
        ApiResponse.setResult(userService.getUser());
        return ApiResponse;
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> getUserById(@PathVariable String id){
        ApiResponse<User> ApiResponse = new ApiResponse<>();
        ApiResponse.setCode(200);
        ApiResponse.setResult(userService.getUserById(id));
        ApiResponse.setMessage("User fetched successfully");
        return ApiResponse;
    }
    @GetMapping("/{name}/name")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> getUserByName(@PathVariable String name){
        ApiResponse<User> ApiResponse = new ApiResponse<>();
        ApiResponse.setCode(200);
        ApiResponse.setResult(userService.getUserByName(name));
        ApiResponse.setMessage("User fetched successfully");
        return ApiResponse;
    }
    // @DeleteMapping("/{id}")
    // ApiResponse<String> deleteUser(@PathVariable String id) {
    //     ApiResponse<String> ApiResponse = new ApiResponse<>();
    //     ApiResponse.setCode(200);
    //     userService.deleteUser(id);
    //     ApiResponse.setMessage("User deleted successfully");
    //     return ApiResponse;
    // }

    // @PatchMapping("/{id}/status")
    // ApiResponse<User> updateStatusUser(@PathVariable String id, @RequestBody UpdatedStatusUserRequest request){
    //     ApiResponse<User> ApiResponse = new ApiResponse<>();
    //     ApiResponse.setCode(200);
    //     ApiResponse.setMessage("User updated successfully");
    //     ApiResponse.setResult(userService.updatedStatusUser(id, request));
    //     return ApiResponse;
    // }

    // @PatchMapping("/{id}/role")
    // ApiResponse<User> updateRoleUser(@PathVariable String id, @RequestBody UpdatedRoleUserRequest request){
    //     ApiResponse<User> ApiResponse = new ApiResponse<>();
    //     ApiResponse.setCode(200);
    //     ApiResponse.setMessage("Role User updated successfully");
    //     ApiResponse.setResult(userService.updatedRoleUser(id, request));
    //     return ApiResponse;
    // }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> updateUser(@PathVariable String id, @RequestBody UserUpdatedRequest request){
        ApiResponse<User> ApiResponse = new ApiResponse<>();
        ApiResponse.setCode(200);
        ApiResponse.setMessage("User updated successfully");
        ApiResponse.setResult(userService.updateUser(id, request));
        return ApiResponse;
    }

    
}
