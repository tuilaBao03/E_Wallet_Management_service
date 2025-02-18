package com.backend.smartwalletapp.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashSet;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.backend.smartwalletapp.Mapper.UserMapper;
import com.backend.smartwalletapp.dto.request.User.UserCreatedRequest;
import com.backend.smartwalletapp.dto.request.User.UserUpdatePassword;
import com.backend.smartwalletapp.dto.request.User.UserUpdatedRequest;
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
    UserMapper userMapper;

    @Transactional
    public User createUser(UserCreatedRequest request) {
        try {
            if (userRepository.existsByUsername(request.getUsername())) {
                throw new AppException(ErrorCode.USER_ALREADY_EXISTS);
            }
            if (request.getPassword() == null || request.getPassword().length() < 6) {
                throw new AppException(ErrorCode.PASSWORD_NOT_VALID);
            }
            // Sử dụng UserMapper để map request thành User
            User user = userMapper.toCreatedUser(request);

            // Thiết lập các trường không có trong UserCreatedRequest
            user.setPassword(passwordEncoder.encode(request.getPassword()));
            user.setStatus(true);
            user.setRole(new HashSet<>() {{
                add(Roles.USER.name());
            }});
            user.setAvatar("constant");
            user.setCreatedDate(Timestamp.from(Instant.now()));
            user.setUpdatedDate(Timestamp.from(Instant.now()));

            return userRepository.save(user);
        } catch (AppException e) {
        throw e; // Giữ nguyên lỗi gốc
    }
        catch (Exception e) {
            e.printStackTrace();
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }

    public List<User> getUser(){
        return userRepository.findAll();
    }
    public User getUserById(String id){
        return userRepository.findById(id).orElseThrow(
            () -> new AppException(ErrorCode.USER_NOT_FOUND));
    }
    public User getUserByName(String name){
        return userRepository.findByUsername(name).orElseThrow(
            ()-> new AppException(ErrorCode.USER_NOT_FOUND));
    }
    public User updateUser(String id, UserUpdatedRequest request){
        if (!userRepository.existsById(id)) {
            throw new AppException(ErrorCode.USER_NOT_FOUND);
        }
        
        User user = userRepository.findById(id).orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));
        // Dùng mapper để cập nhật thông tin từ request vào user
        userMapper.updateUserFromRequest(request, user);
    
        // Cập nhật các giá trị đặc biệt không có trong request
        user.setUpdatedDate(Timestamp.from(Instant.now()));
    
        return userRepository.save(user);
    }
    public String ChangerPassword(String id, UserUpdatePassword request){
        User user = userRepository.findById(id).orElseThrow(
            () -> new AppException(ErrorCode.USER_NOT_FOUND)
        );
        boolean auth = passwordEncoder.matches(request.getOldPassword(), user.getPassword());
        if(auth == true){
            user.setPassword(passwordEncoder.encode(request.getNewPassword()));
            userRepository.save(user);
            return "Update Password successed";
        }
        else{
            return "Password wrong";
        }
    }

    
}
