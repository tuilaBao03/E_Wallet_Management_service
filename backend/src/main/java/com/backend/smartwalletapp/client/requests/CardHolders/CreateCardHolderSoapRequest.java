package com.backend.smartwalletapp.client.requests.CardHolders;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@XmlRootElement(name = "CreateCardHolderRequest")
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateCardHolderSoapRequest {
    @XmlElement(name = "PhoneNumber", required = true)
    String phoneNumber;

    @XmlElement(name = "HomeAddress")
    String homeAddress;

    @XmlElement(name = "CompanyAddress")
    String companyAddress;

    @XmlElement(name = "LastName", required = true)
    String lastName;

    @XmlElement(name = "FirstName", required = true)
    String firstName;

    @XmlElement(name = "Avatar")
    String avatar;

    @XmlElement(name = "Email")
    String email;

    @XmlElement(name = "Reason")
    String Reason;

    @XmlElement(name = "ClientTypeCode", required = true)
    String ClientTypeCode;

    @XmlElement(name = "InstitutionCode", required = true)
    String InstitutionCode;

    @XmlElement(name = "Branch")
    String Branch;

    @XmlElement(name = "ClientCategory")
    String ClientCategory;

    @XmlElement(name = "ProductCategory")
    String ProductCategory;

    @XmlElement(name = "ShortName")
    String ShortName;
}




