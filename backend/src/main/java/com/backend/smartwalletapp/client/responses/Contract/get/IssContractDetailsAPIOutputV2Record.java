package com.backend.smartwalletapp.client.responses.Contract.get;

import java.util.List;

import jakarta.xml.bind.annotation.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@XmlAccessorType(XmlAccessType.FIELD)
@Getter
@Setter
@Data
@AllArgsConstructor
@Builder
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)

@XmlRootElement(name = "IssContractDetailsAPIOutputV2Record",namespace = "http://www.openwaygroup.com/wsint")
public class IssContractDetailsAPIOutputV2Record {

    @XmlElement(name = "Institution",namespace = "http://www.openwaygroup.com/wsint")
    private String institution;

    @XmlElement(name = "Branch",namespace = "http://www.openwaygroup.com/wsint")
    private String branch;

    @XmlElement(name = "ClientCategory",namespace = "http://www.openwaygroup.com/wsint")
    private String clientCategory;

    @XmlElement(name = "ClientType",namespace = "http://www.openwaygroup.com/wsint")
    private String clientType;

    @XmlElement(name = "ProductCategory",namespace = "http://www.openwaygroup.com/wsint")
    private String productCategory;

    @XmlElement(name = "RedefinedProductCategory",namespace = "http://www.openwaygroup.com/wsint")
    private String redefinedProductCategory;

    @XmlElement(name = "ContractCategory",namespace = "http://www.openwaygroup.com/wsint")
    private String contractCategory;

    @XmlElement(name = "MainProductCorrected",namespace = "http://www.openwaygroup.com/wsint")
    private String mainProductCorrected;

    @XmlElement(name = "MainProductIDT",namespace = "http://www.openwaygroup.com/wsint")
    private String mainProductIDT;

    @XmlElement(name = "Product",namespace = "http://www.openwaygroup.com/wsint")
    private String product;

    @XmlElement(name = "ContractSubtype",namespace = "http://www.openwaygroup.com/wsint")
    private String contractSubtype;

    @XmlElement(name = "ReportType",namespace = "http://www.openwaygroup.com/wsint")
    private String reportType;

    @XmlElement(name = "Role",namespace = "http://www.openwaygroup.com/wsint")
    private String role;

    @XmlElement(name = "Icon",namespace = "http://www.openwaygroup.com/wsint")
    private String icon;

    @XmlElement(name = "Leaf",namespace = "http://www.openwaygroup.com/wsint")
    private String leaf;

    @XmlElement(name = "Currency",namespace = "http://www.openwaygroup.com/wsint")
    private String currency;

    @XmlElement(name = "Available",namespace = "http://www.openwaygroup.com/wsint")
    private Double available;

    @XmlElement(name = "Balance",namespace = "http://www.openwaygroup.com/wsint")
    private Double balance;

    @XmlElement(name = "CreditLimit",namespace = "http://www.openwaygroup.com/wsint")
    private Double creditLimit;

    @XmlElement(name = "AddLimit",namespace = "http://www.openwaygroup.com/wsint")
    private Double addLimit;

    @XmlElement(name = "Blocked",namespace = "http://www.openwaygroup.com/wsint")
    private Double blocked;

    @XmlElement(name = "TotalDue",namespace = "http://www.openwaygroup.com/wsint")
    private Double totalDue;

    @XmlElement(name = "PastDue",namespace = "http://www.openwaygroup.com/wsint")
    private Double pastDue;

    @XmlElement(name = "ShadowAuthLimit",namespace = "http://www.openwaygroup.com/wsint")
    private Double shadowAuthLimit;

    @XmlElement(name = "Client",namespace = "http://www.openwaygroup.com/wsint")
    private String client;

    @XmlElement(name = "ContractNumber",namespace = "http://www.openwaygroup.com/wsint")
    private String contractNumber;

    @XmlElement(name = "SafeContractNumber",namespace = "http://www.openwaygroup.com/wsint")
    private String safeContractNumber;

    @XmlElement(name = "ContractName",namespace = "http://www.openwaygroup.com/wsint")
    private String contractName;

    @XmlElement(name = "ContractLevel",namespace = "http://www.openwaygroup.com/wsint")
    private String contractLevel;

    @XmlElement(name = "BillingContract",namespace = "http://www.openwaygroup.com/wsint")
    private String billingContract;

    @XmlElement(name = "TopContract",namespace = "http://www.openwaygroup.com/wsint")
    private String topContract;

    @XmlElement(name = "CBSNumber",namespace = "http://www.openwaygroup.com/wsint")
    private String cbsNumber;

    @XmlElement(name = "OpenDate",namespace = "http://www.openwaygroup.com/wsint")
    private String openDate;

    @XmlElement(name = "CheckUsage",namespace = "http://www.openwaygroup.com/wsint")
    private String checkUsage;

    @XmlElement(name = "LastBillingDate",namespace = "http://www.openwaygroup.com/wsint")
    private String lastBillingDate;

    @XmlElement(name = "NextBillingDate",namespace = "http://www.openwaygroup.com/wsint")
    private String nextBillingDate;

    @XmlElement(name = "PastDueDays",namespace = "http://www.openwaygroup.com/wsint")
    private int pastDueDays;

    @XmlElement(name = "AddParmString",namespace = "http://www.openwaygroup.com/wsint")
    private String addParmString;

    @XmlElement(name = "Status",namespace = "http://www.openwaygroup.com/wsint")
    private String status;

    @XmlElement(name = "StatusCode",namespace = "http://www.openwaygroup.com/wsint")
    private String statusCode;

    @XmlElement(name = "ExternalCode",namespace = "http://www.openwaygroup.com/wsint")
    private String externalCode;

    @XmlElement(name = "LastApplicationDate",namespace = "http://www.openwaygroup.com/wsint")
    private String lastApplicationDate;

    @XmlElement(name = "LastApplicationOfficer",namespace = "http://www.openwaygroup.com/wsint")
    private String lastApplicationOfficer;

    @XmlElement(name = "LastApplicationStatus",namespace = "http://www.openwaygroup.com/wsint")
    private String lastApplicationStatus;

    @XmlElement(name = "LastActivityDate",namespace = "http://www.openwaygroup.com/wsint")
    private String lastActivityDate;

    @XmlElement(name = "Ready",namespace = "http://www.openwaygroup.com/wsint")
    private String ready;

    @XmlElement(name = "AmendmentDate",namespace = "http://www.openwaygroup.com/wsint")
    private String amendmentDate;

    @XmlElement(name = "AmendmentOfficer",namespace = "http://www.openwaygroup.com/wsint")
    private String amendmentOfficer;

    @XmlElement(name = "ID",namespace = "http://www.openwaygroup.com/wsint")
    private String id;

    @XmlElement(name = "ClientFullName",namespace = "http://www.openwaygroup.com/wsint")
    private String clientFullName;

    @XmlElement(name = "ProductCode",namespace = "http://www.openwaygroup.com/wsint")
    private String productCode;

    @XmlElement(name = "MainProductCode",namespace = "http://www.openwaygroup.com/wsint")
    private String mainProductCode;

    @XmlElement(name = "ParentProduct", namespace = "http://www.openwaygroup.com/wsint")
    private String parentProduct;

    @XmlElement(name = "ParentContract", namespace = "http://www.openwaygroup.com/wsint")
    private String parentContract;

    @XmlElement(name = "LiabilityCategory", namespace = "http://www.openwaygroup.com/wsint")
    private String liabilityCategory;

    @XmlElement(name = "LiabilityContract", namespace = "http://www.openwaygroup.com/wsint")
    private String liabilityContract;

    @XmlElement(name = "AddInfo01", namespace = "http://www.openwaygroup.com/wsint")
    private String addInfo01;

    @XmlElement(name = "AddInfo02", namespace = "http://www.openwaygroup.com/wsint")
    private String addInfo02;

    @XmlElement(name = "BehaviourType", namespace = "http://www.openwaygroup.com/wsint")
    private String behaviourType;

    @XmlElement(name = "ParentProductCode", namespace = "http://www.openwaygroup.com/wsint")
    private String parentProductCode;


    List<IssContractDetailsAPIOutputV2Record> contract;
}

