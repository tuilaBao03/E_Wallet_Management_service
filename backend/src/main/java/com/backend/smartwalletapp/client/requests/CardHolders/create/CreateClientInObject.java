package com.backend.smartwalletapp.client.requests.CardHolders.create;

import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlElement;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class CreateClientInObject {
    @XmlElement(name = "InstitutionCode", namespace = "http://www.openwaygroup.com/wsint") 
    private String institutionCode;
    
    @XmlElement(name = "Branch", namespace = "http://www.openwaygroup.com/wsint") 
    private String branch;
    
    @XmlElement(name = "ClientTypeCode", namespace = "http://www.openwaygroup.com/wsint") 
    private String clientTypeCode;
    
    @XmlElement(name = "ClientCategory", namespace = "http://www.openwaygroup.com/wsint") 
    private String clientCategory;
    
    @XmlElement(name = "ServiceGroup", namespace = "http://www.openwaygroup.com/wsint") 
    private String serviceGroup;
    
    @XmlElement(name = "ProductCategory", namespace = "http://www.openwaygroup.com/wsint") 
    private String productCategory;
    
    @XmlElement(name = "LanguageCode", namespace = "http://www.openwaygroup.com/wsint") 
    private String languageCode;
    
    @XmlElement(name = "SalutationSuffix", namespace = "http://www.openwaygroup.com/wsint") 
    private String salutationSuffix;
    
    @XmlElement(name = "ShortName", namespace = "http://www.openwaygroup.com/wsint") 
    private String shortName;
    
    @XmlElement(name = "FirstName", namespace = "http://www.openwaygroup.com/wsint") 
    private String firstName;
    
    @XmlElement(name = "LastName", namespace = "http://www.openwaygroup.com/wsint") 
    private String lastName;
    
    @XmlElement(name = "MiddleName", namespace = "http://www.openwaygroup.com/wsint") 
    private String middleName;
    
    @XmlElement(name = "MaritalStatusCode", namespace = "http://www.openwaygroup.com/wsint") 
    private String maritalStatusCode;
    
    @XmlElement(name = "SocialSecurityNumber", namespace = "http://www.openwaygroup.com/wsint") 
    private String socialSecurityNumber;
    
    @XmlElement(name = "SalutationCode", namespace = "http://www.openwaygroup.com/wsint") 
    private String salutationCode;
    
    @XmlElement(name = "BirthDate", namespace = "http://www.openwaygroup.com/wsint") 
    private String birthDate;
    
    @XmlElement(name = "Gender", namespace = "http://www.openwaygroup.com/wsint") 
    private String gender;
    
    @XmlElement(name = "BirthPlace", namespace = "http://www.openwaygroup.com/wsint") 
    private String birthPlace;
    
    @XmlElement(name = "BirthName", namespace = "http://www.openwaygroup.com/wsint") 
    private String birthName;
    
    @XmlElement(name = "Citizenship", namespace = "http://www.openwaygroup.com/wsint") 
    private String citizenship;
    
    @XmlElement(name = "TaxBracket", namespace = "http://www.openwaygroup.com/wsint") 
    private String taxBracket;
    
    @XmlElement(name = "IndividualTaxpayerNumber", namespace = "http://www.openwaygroup.com/wsint") 
    private String individualTaxpayerNumber;
    
    @XmlElement(name = "SecretPhrase", namespace = "http://www.openwaygroup.com/wsint") 
    private String secretPhrase;
    
    @XmlElement(name = "CompanyName", namespace = "http://www.openwaygroup.com/wsint") 
    private String companyName;
    
    @XmlElement(name = "Trademark", namespace = "http://www.openwaygroup.com/wsint") 
    private String trademark;
    
    @XmlElement(name = "Department", namespace = "http://www.openwaygroup.com/wsint") 
    private String department;
    
    @XmlElement(name = "EmbossedTitleCode", namespace = "http://www.openwaygroup.com/wsint") 
    private String embossedTitleCode;
    
    @XmlElement(name = "EmbossedFirstName", namespace = "http://www.openwaygroup.com/wsint") 
    private String embossedFirstName;
    
    @XmlElement(name = "EmbossedLastName", namespace = "http://www.openwaygroup.com/wsint") 
    private String embossedLastName;
    
    @XmlElement(name = "EmbossedCompanyName", namespace = "http://www.openwaygroup.com/wsint") 
    private String embossedCompanyName;
    
    @XmlElement(name = "IdentityCardType", namespace = "http://www.openwaygroup.com/wsint") 
    private String identityCardType;
    
    @XmlElement(name = "IdentityCardNumber", namespace = "http://www.openwaygroup.com/wsint") 
    private String identityCardNumber;
    
    @XmlElement(name = "IdentityCardDetails", namespace = "http://www.openwaygroup.com/wsint") 
    private String identityCardDetails;
    
    @XmlElement(name = "ClientNumber", namespace = "http://www.openwaygroup.com/wsint") 
    private String clientNumber;
    
    @XmlElement(name = "Profession", namespace = "http://www.openwaygroup.com/wsint") 
    private String profession;
    
    @XmlElement(name = "EMail", namespace = "http://www.openwaygroup.com/wsint") 
    private String eMail;
    
    @XmlElement(name = "AddressLine1", namespace = "http://www.openwaygroup.com/wsint") 
    private String addressLine1;
    
    @XmlElement(name = "AddressLine2", namespace = "http://www.openwaygroup.com/wsint") 
    private String addressLine2;
    
    @XmlElement(name = "AddressLine3", namespace = "http://www.openwaygroup.com/wsint") 
    private String addressLine3;
    
    @XmlElement(name = "AddressLine4", namespace = "http://www.openwaygroup.com/wsint") 
    private String addressLine4;
    
    @XmlElement(name = "City", namespace = "http://www.openwaygroup.com/wsint") 
    private String city;
    
    @XmlElement(name = "HomePhone", namespace = "http://www.openwaygroup.com/wsint") 
    private String homePhone;
    
    @XmlElement(name = "MobilePhone", namespace = "http://www.openwaygroup.com/wsint") 
    private String mobilePhone;
    
    @XmlElement(name = "BusinessPhone", namespace = "http://www.openwaygroup.com/wsint") 
    private String businessPhone;
    
}

