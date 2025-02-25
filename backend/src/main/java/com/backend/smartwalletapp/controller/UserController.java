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
    ApiResponse<User> createRequestUser(@RequestBody @Valid UserCreatedRequest request) {
        return ApiResponse.<User>builder()
                .code(200)
                .message("User created successfully")
                .result(userService.createUser(request))
                .build();
    }

    @GetMapping
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<List<User>> getUser() {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        log.info("Username: {}", authentication.getName());
        authentication.getAuthorities().forEach(grantedAuthority -> log.info(grantedAuthority.getAuthority()));
        
        return ApiResponse.<List<User>>builder()
                .result(userService.getUser())
                .code(200)
                .message("User fetched successfully")
                .build();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> getUserById(@PathVariable String id) {
        return ApiResponse.<User>builder()
                .code(200)
                .result(userService.getUserById(id))
                .message("User fetched successfully")
                .build();
    }

    @GetMapping("/{name}/name")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> getUserByName(@PathVariable String name) {
        return ApiResponse.<User>builder()
                .code(200)
                .result(userService.getUserByName(name))
                .message("User fetched successfully")
                .build();
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole(Roles.USER.name()) or hasRole(Roles.ADMIN.name())")
    ApiResponse<User> updateUser(@PathVariable String id, @RequestBody UserUpdatedRequest request) {
        return ApiResponse.<User>builder()
                .code(200)
                .message("User updated successfully")
                .result(userService.updateUser(id, request))
                .build();
    }
}
