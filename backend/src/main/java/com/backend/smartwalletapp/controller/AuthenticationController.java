package com.backend.smartwalletapp.controller;
import java.text.ParseException;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.dto.request.Login.AuthenticationRequest;
import com.backend.smartwalletapp.dto.request.Login.IntrospectRequest;
import com.backend.smartwalletapp.dto.request.Login.RefreshTokenRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.AuthenticationResponse;
import com.backend.smartwalletapp.dto.response.IntrospectResponse;
import com.backend.smartwalletapp.dto.response.RefreshTokenResponse;
import com.backend.smartwalletapp.service.AuthenticationService;
import com.nimbusds.jose.JOSEException;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.experimental.FieldDefaults;
@RestController
@RequestMapping("/auth")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@AllArgsConstructor
public class AuthenticationController {
    AuthenticationService authenticationService;
    @PostMapping("/login")
    ApiResponse<AuthenticationResponse> login(@RequestBody AuthenticationRequest request) {
        var result = authenticationService.authenticate(request);
        System.err.println("result"+result);
        return ApiResponse.<AuthenticationResponse>builder()
        .result(result)
        .build();
    }

    @PostMapping("/introspect")
    ApiResponse<IntrospectResponse> introspect(@RequestBody IntrospectRequest request)
     throws JOSEException, ParseException {
        var result = authenticationService.introspectResponse(request);
        System.err.println(result);
        return ApiResponse.<IntrospectResponse>builder()
        .result(result)
        .build();
    }

    @PostMapping("/logout")
    public String logout() {
        SecurityContextHolder.clearContext();  // Xóa context đăng nhập
        return "Logout successful";
    }

    @PostMapping("/refresh")
    public ResponseEntity<RefreshTokenResponse> refresh(@RequestBody RefreshTokenRequest request) {
        return ResponseEntity.ok(authenticationService.refreshToken(request));
    }
}
