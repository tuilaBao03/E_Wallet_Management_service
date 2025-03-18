package com.backend.smartwalletapp.dto.response.Contract.GetContract;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class Contract {
    private String institution;
    private String branch;
    private String clientCategory;
    private String clientType;
    private String productCategory;
    private String redefinedProductCategory;
    private String contractCategory;
    private String mainProductCorrected;
    private String mainProductIDT;
    private String product;
    private String contractSubtype;
    private String reportType;
    private String role;
    private String icon;
    private String leaf;
    private String currency;
    private Double available;
    private Double balance;
    private Double creditLimit;
    private Double addLimit;
    private Double blocked;
    private Double totalDue;
    private Double pastDue;
    private Double shadowAuthLimit;
    private String client;
    private String contractNumber;
    private String safeContractNumber;
    private String contractName;
    private String contractLevel;
    private String billingContract;
    private String topContract;
    private String cbsNumber;
    private String openDate;
    private String checkUsage;
    private String lastBillingDate;
    private String nextBillingDate;
    private int pastDueDays;
    private String addParmString;
    private String status;
    private String statusCode;
    private String externalCode;
    private String lastApplicationDate;
    private String lastApplicationOfficer;
    private String lastApplicationStatus;
    private String lastActivityDate;
    private String ready;
    private String amendmentDate;
    private String amendmentOfficer;
    private String id;
    private String clientFullName;
    private String productCode;
    private String mainProductCode;
}
