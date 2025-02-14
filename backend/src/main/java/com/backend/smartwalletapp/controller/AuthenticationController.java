package com.backend.smartwalletapp.controller;
import java.text.ParseException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.smartwalletapp.dto.request.Login.AuthenticationRequest;
import com.backend.smartwalletapp.dto.request.Login.IntrospectRequest;
import com.backend.smartwalletapp.dto.response.ApiResponse;
import com.backend.smartwalletapp.dto.response.AuthenticationResponse;
import com.backend.smartwalletapp.dto.response.IntrospectResponse;
import com.backend.smartwalletapp.service.AuthenticationSevice;
import com.nimbusds.jose.JOSEException;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
@RestController
@RequestMapping("/auth")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthenticationController {
    AuthenticationSevice authenticationSevice;
    public AuthenticationController(AuthenticationSevice authenticationSevice) {
        this.authenticationSevice = authenticationSevice;
    }
    @PostMapping("/login")
    ApiResponse<AuthenticationResponse> login(@RequestBody AuthenticationRequest request) {
        var result = authenticationSevice.authenticate(request);
        System.err.println("result"+result);
        return ApiResponse.<AuthenticationResponse>builder()
        .result(result)
        .build();
    }

    @PostMapping("/introspect")
    ApiResponse<IntrospectResponse> introspect(@RequestBody IntrospectRequest request)
     throws JOSEException, ParseException {
        var result = authenticationSevice.introspectResponse(request);
        System.err.println(result);
        return ApiResponse.<IntrospectResponse>builder()
        .result(result)
        .build();
    }
}
