package com.backend.smartwalletapp.model;

import java.sql.Timestamp;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String userId;

    @Column(unique = true, nullable =  false)
    @NotNull(message = "Username cannot be null")
    String username;

    @Column( nullable =  false)
    @NotNull(message = "password cannot be null")
    String password;

    @Column( nullable =  false)
    @NotNull(message = "phoneNumber cannot be null")
    String phoneNumber;

    @Column( nullable =  false)
    @NotNull(message = "homeAddress cannot be null")
    String homeAddress;

    @Column( nullable =  false)
    @NotNull(message = "companyAddress cannot be null")
    String companyAddress;

    @Column( nullable =  false)
    @NotNull(message = "Lastname cannot be null")
    String lastName;

    @Column(nullable =  false)
    @NotNull(message = "First name cannot be null")
    String firstName;
    
    @Column(nullable =  false)
    @NotNull(message = "Email cannot be null")
    String email;

    @Column(nullable = false)
    @NotNull(message = "Role cannot be null")
    private Set<String> role;

    String avatar;
    Timestamp createdDate;
    Timestamp updatedDate;
    boolean status;
}
