package com.backend.smartwalletapp.client.requests.CardHolders.edit;
import jakarta.xml.bind.annotation.*;
import lombok.*;



@XmlAccessorType(XmlAccessType.FIELD)
@NoArgsConstructor
@Data
@AllArgsConstructor
class EditClient_InObject_EditV6 {

    @XmlElement(name = "Branch", namespace = "http://www.openwaygroup.com/wsint")
    private String branch;

    @XmlElement(name = "ClientCategory", namespace = "http://www.openwaygroup.com/wsint")
    private String clientCategory;

    @XmlElement(name = "ServiceGroup", namespace = "http://www.openwaygroup.com/wsint")
    private String serviceGroup;

    @XmlElement(name = "ProductCategory", namespace = "http://www.openwaygroup.com/wsint")
    private String productCategory;

    @XmlElement(name = "ClientTypeCode", namespace = "http://www.openwaygroup.com/wsint")
    private String clientTypeCode;

    @XmlElement(name = "ShortName", namespace = "http://www.openwaygroup.com/wsint")
    private String shortName;

    @XmlElement(name = "SalutationCode", namespace = "http://www.openwaygroup.com/wsint")
    private String salutationCode;

    @XmlElement(name = "SalutationSuffix", namespace = "http://www.openwaygroup.com/wsint")
    private String salutationSuffix;

    @XmlElement(name = "Gender", namespace = "http://www.openwaygroup.com/wsint")
    private String gender;

    @XmlElement(name = "FirstName", namespace = "http://www.openwaygroup.com/wsint")
    private String firstName;

    @XmlElement(name = "MiddleName", namespace = "http://www.openwaygroup.com/wsint")
    private String middleName;

    @XmlElement(name = "LastName", namespace = "http://www.openwaygroup.com/wsint")
    private String lastName;

    @XmlElement(name = "BirthDate", namespace = "http://www.openwaygroup.com/wsint")
    private String birthDate;

    @XmlElement(name = "BirthPlace", namespace = "http://www.openwaygroup.com/wsint")
    private String birthPlace;

    @XmlElement(name = "BirthName", namespace = "http://www.openwaygroup.com/wsint")
    private String birthName;

    @XmlElement(name = "LanguageCode", namespace = "http://www.openwaygroup.com/wsint")
    private String languageCode;

    @XmlElement(name = "Citizenship", namespace = "http://www.openwaygroup.com/wsint")
    private String citizenship;

    @XmlElement(name = "MaritalStatusCode", namespace = "http://www.openwaygroup.com/wsint")
    private String maritalStatusCode;

    @XmlElement(name = "TaxBracket", namespace = "http://www.openwaygroup.com/wsint")
    private String taxBracket;

    @XmlElement(name = "IndividualTaxpayerNumber", namespace = "http://www.openwaygroup.com/wsint")
    private String individualTaxpayerNumber;

    @XmlElement(name = "DateExpire", namespace = "http://www.openwaygroup.com/wsint")
    private String dateExpire;

    @XmlElement(name = "HomePhone", namespace = "http://www.openwaygroup.com/wsint")
    private String homePhone;

    @XmlElement(name = "MobilePhone", namespace = "http://www.openwaygroup.com/wsint")
    private String mobilePhone;

    @XmlElement(name = "BusinessPhone", namespace = "http://www.openwaygroup.com/wsint")
    private String businessPhone;

    @XmlElement(name = "EMail", namespace = "http://www.openwaygroup.com/wsint")
    private String email;

    @XmlElement(name = "Country", namespace = "http://www.openwaygroup.com/wsint")
    private String country;

    @XmlElement(name = "State", namespace = "http://www.openwaygroup.com/wsint")
    private String state;

    @XmlElement(name = "City", namespace = "http://www.openwaygroup.com/wsint")
    private String city;

    @XmlElement(name = "AddressZIP", namespace = "http://www.openwaygroup.com/wsint")
    private String addressZip;

    @XmlElement(name = "AddressLine1", namespace = "http://www.openwaygroup.com/wsint")
    private String addressLine1;

    @XmlElement(name = "Profession", namespace = "http://www.openwaygroup.com/wsint")
    private String profession;

    @XmlElement(name = "EmbossedLastName", namespace = "http://www.openwaygroup.com/wsint")
    private String embossedLastName;

    @XmlElement(name = "EmbossedFirstName", namespace = "http://www.openwaygroup.com/wsint")
    private String embossedFirstName;
}

