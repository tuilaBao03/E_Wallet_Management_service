package com.backend.smartwalletapp.model;

import java.sql.Timestamp;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String contractID;

    @Column( nullable =  false)
    @NotNull(message = "status cannot be null")
    private boolean status;

    @Column( nullable =  false)
    @NotNull(message = "note cannot be null")
    private String note;

    @Column( nullable =  false)
    @NotNull(message = "url cannot be null")
    private String url;

    private String parentContract;
    private boolean typeContract;
    private Timestamp createdDate;
    private Timestamp updatedDate;

    @ManyToOne
    @JoinColumn(name = "cardHolderID", nullable = false)
    @JsonIgnore
    private CardHolder cardHolder;

    @OneToMany(mappedBy = "contract",cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Transaction> Transactions;


}
