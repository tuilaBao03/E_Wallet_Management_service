// ignore_for_file: file_names

import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/models/user.dart';

User selectedUserInittial = User(
    username: "",
    password: "",
    phoneNumber: "",
    homeAddress: "",
    companyAddress: "",
    lastName: "",
    firstName: "Hà",
    avatar: "",
    email: "", userId: '',
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
  );
  final CardHolder emptyCardHolder = CardHolder(
  reason: "Create lient",
  institutionCode: "9999",
  branch: "9999",
  clientTypeCode: "PR",
  clientCategory: "",
  serviceGroup: "",
  productCategory: "",
  languageCode: "",
  salutationSuffix: "",
  shortName: "",
  firstName: "",
  lastName: "",
  middleName: "",
  maritalStatusCode: "",
  socialSecurityNumber: "0",
  salutationCode: "MR",
  birthDate: DateTime.now(),
  gender: "",
  birthPlace: "",
  birthName: "",
  citizenship: "",
  taxBracket: "",
  individualTaxpayerNumber: "0",
  secretPhrase: "",
  companyName: "OPenWay",
  trademark: "",
  department: "",
  embossedTitleCode: "",
  embossedFirstName: "",
  embossedLastName: "",
  embossedCompanyName: "",
  identityCardType: "",
  identityCardNumber: "0",
  identityCardDetails: "",
  clientNumber: "0",
  profession: "",
  eMail: "",
  addressLine1: "",
  addressLine2: "",
  addressLine3: "",
  addressLine4: "",
  city: "",
  homePhone: "",
  mobilePhone: "",
  businessPhone: "",
  customData: [],
);

  CardInfo selectedCardInittial = CardInfo(
    bankName: "",
    balance: 1328,
    svgSrc: "",
    color: primaryColor,
    CardID: '',
    userId: '',
    typeCard: "",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    contractID: "",
    cardHolderId: '', limit: 0,
  );
  Transaction selectedTransactionInittial = Transaction(
    icon: "",
    bankName: "",
    date: DateTime.now(),
    budget: "",
    typeMoney:"",
    typeTransaction: 0, 
    transactionId: '', contractID: '', note: ''
  );
  Contract selectedContractInittial = 
  Contract(
    reason: "to test",
    branch: "9999",
    institutionCode: "9999",
    productCode: "",
    productCode2: "",
    productCode3: "",
    cbsNumber: "",
    customData: "",
    contractName: "",
    clientIdentifier: "",
    clientSearchMethod: "CLIENT_NUMBER",
  );