package com.backend.smartwalletapp.model;

import java.sql.Timestamp;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class CardHolder {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String cardHolderId;

    @Column( nullable =  false)
    @NotNull(message = "phoneNumber cannot be null")
    private String phoneNumber;
    private String homeAddress;
    private String companyAddress;

    @Column( nullable =  false)
    @NotNull(message = "lastName cannot be null")
    private String lastName;

    @Column( nullable =  false)
    @NotNull(message = "firstName cannot be null")
    private String firstName;
    private String avatar;

    @Column( nullable =  false)
    @NotNull(message = "email cannot be null")
    private String email;
    
    private Timestamp createdDate;
    private Timestamp updateDate;
    private boolean status;

    @OneToMany(mappedBy = "cardHolder", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Contract> contracts;
}
