// ignore_for_file: file_names
import 'package:smartwalletapp/models/create_card_request.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
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
  final CreateCardHolderRequest emptyCardHolder_ADD = CreateCardHolderRequest(
  reason: "Create lient",
  institutionCode: "9999",
  branch: "9999",
  clientTypeCode: "PR",
  clientCategory: "",
  serviceGroup: "",
  productCategory: "",
  languageCode: "",
  salutationSuffix: "",
  shortName: "Ha Gia Bao",
  firstName: "Bao",
  lastName: "Ha",
  middleName: "Gia",
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
  eMail: "hagiabao@gmail.com",
  addressLine1: "thaibinh",
  addressLine2: "thaibinh",
  addressLine3: "thaibinh",
  addressLine4: "thaibinh",
  city: "thaibinh",
  homePhone: "0888379199",
  mobilePhone: "",
  businessPhone: "",
  customData: [],
);

  CreateCardRequest selectedCardInittial = CreateCardRequest(
    contractSearchMethod: 'CONTRACT_NUMBER',
    contractIdentifier: '',
    productCode: 'CARD_TRAINING01',
    productCode2: '',
    productCode3: '',
    cardName: '',
    cbsNumber: '',
    embossedFirstName: 'Phan',
    embossedLastName: 'Hong',
    embossedCompanyName: 'OpenWay');
  CreateContractRequest selectedContractInittial = CreateContractRequest(
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
  