package com.backend.smartwalletapp.dto.request.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.AccessLevel;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserCreatedRequest {
    String username;
    String password;
    String phoneNumber;
    String homeAddress;
    String companyAddress;
    String lastName;
    String firstName;
    String email;
}
