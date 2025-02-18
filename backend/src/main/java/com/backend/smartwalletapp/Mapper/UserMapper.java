package com.backend.smartwalletapp.Mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;

import com.backend.smartwalletapp.dto.request.User.UserCreatedRequest;
import com.backend.smartwalletapp.dto.request.User.UserUpdatedRequest;
import com.backend.smartwalletapp.model.User;



@Mapper(componentModel = "spring")
public interface UserMapper {
    User toCreatedUser(UserCreatedRequest userCreatedRequest);
    void updateUserFromRequest(UserUpdatedRequest request, @MappingTarget User user);
} 
