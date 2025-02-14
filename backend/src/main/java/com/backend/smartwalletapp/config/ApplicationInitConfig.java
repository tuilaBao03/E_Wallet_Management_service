package com.backend.smartwalletapp.config;
import java.sql.Timestamp;
import java.util.HashSet;

import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.backend.smartwalletapp.enums.Roles;
import com.backend.smartwalletapp.model.User;
import com.backend.smartwalletapp.repository.UserRepository;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;

@Configuration
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class ApplicationInitConfig {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;  // Ensure it's injected

    @Bean
    ApplicationRunner applicationRunner() {
        return args -> {
            log.info("Checking if user exists...");
            boolean checking = userRepository.existsByUsername("admin1");
            if (!checking) {
                log.info("No user found with username: admin1. Creating default user.");
                var roles = new HashSet<String>();
                roles.add(Roles.ADMIN.name());

                User user = User.builder()
                    .username("admin1")
                    .password(passwordEncoder.encode("admin1"))
                    .role(roles)
                    .firstName("Admin")
                    .lastName("User")
                    .email("admin@example.com")
                    .phoneNumber("0888379199")
                    .homeAddress("123 Admin St.")
                    .companyAddress("123 Admin St.")
                    .avatar("default-avatar.png")
                    .createdDate(new Timestamp(System.currentTimeMillis()))
                    .updatedDate(new Timestamp(System.currentTimeMillis()))
                    .status(true)
                    .build();

                try {
                    userRepository.save(user);
                    log.info("User admin1 has been created successfully!");
                } catch (Exception e) {
                    log.error("Error while creating admin user: ", e);
                }
            } else {
                log.info("User with username 'admin1' already exists.");
            }
        };
    }
}

