package com.backend.smartwalletapp.model;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "card_holder") // Đảm bảo tên bảng đúng trong DB
public class CardHolder {
    
    @Id
    @Column(name = "client_identifier") // Đặt đúng tên cột trong DB
    private String clientIdentifier;
}

