package com.backend.smartwalletapp.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashSet;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.backend.smartwalletapp.dto.request.user.UserCreateRequest;
import com.backend.smartwalletapp.enums.Roles;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.User;
import com.backend.smartwalletapp.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;

@Service

@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class UserService {

    UserRepository userRepository;
    PasswordEncoder passwordEncoder;

    @Transactional
    public User createUser(UserCreateRequest request){
        try {
            User user = new User();
            if(userRepository.existsByUsername(request.getUsername())){
                throw new AppException(ErrorCode.USER_ALREADY_EXISTS);
            }
            user.setUsername(request.getUsername());
            if(request.getPassword() == null || request.getPassword().length() < 6){
                throw new AppException(ErrorCode.PASSWORD_NOT_VALID);
            }
            user.setPassword(passwordEncoder.encode(request.getPassword()));
            user.setPhoneNumber(request.getPhoneNumber());
            user.setHomeAddress(request.getHomeAddress());
            user.setCompanyAddress(request.getCompanyAddress());
            user.setLastName(request.getLastName());
            user.setFirstName(request.getFirstName());
            user.setStatus(true);
            HashSet<String> roles = new HashSet<>();
            roles.add(Roles.USER.name());
            user.setRole(roles);
            user.setAvatar("constant");
            user.setEmail(request.getEmail());
            user.setCreatedDate(Timestamp.from(Instant.now()));
            user.setUpdatedDate(Timestamp.from(Instant.now()));
    
            return userRepository.save(user);
        } catch (Exception e) {
            e.printStackTrace(); // In stack trace để xem lỗi cụ thể
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }
}
