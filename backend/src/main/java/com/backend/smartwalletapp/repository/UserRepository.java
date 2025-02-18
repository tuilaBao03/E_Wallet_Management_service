package com.backend.smartwalletapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.backend.smartwalletapp.model.User;


import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<User, String> {
    boolean existsByUsername(String username);
    @SuppressWarnings("null")
    boolean existsById(String id);
    Optional<User> findByUserId(String userId);
    Optional<User> findByUsername(String username);
} 