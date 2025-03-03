package com.backend.smartwalletapp.model;

import java.sql.Timestamp;
import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class Contract {
    private String contractID;
    private boolean status;
    private String note;
    private String url;
    private String parent;
    private String parentContract;
    private boolean typeContract;
    private Timestamp createdDate;
    private Timestamp updatedDate;
    private String cardHolderID;
    private List<Contract> chidrendContract;

}
