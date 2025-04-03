// ignore_for_file: file_names
import 'package:smartwalletapp/request/create_contract_liab_request.dart';
import 'package:smartwalletapp/request/user.dart';

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
  CreateContractLiabRequest selectedContractInittial = CreateContractLiabRequest(
    reason: "to test",
    clientIdentifier: "",
    clientSearchMethod: "CLIENT_NUMBER",
    contractInfo: CreateContractInObject(
      branch: "0101",
      institutionCode: "0001",
      productCode: "",
      productCode2: "",
      productCode3: "",
      contractName: "",
      cbsNumber: "",
    ),
    customData: "",
  );
  