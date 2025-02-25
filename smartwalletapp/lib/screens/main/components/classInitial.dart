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
  CardHolder selectedcardHolderInittial = CardHolder(
    cardHolderId: '',
    phoneNumber: '',
    homeAddress: '',
    companyAddress: '',
    lastName: '',
    firstName: '',
    avatar: '',
    email: '',
    createdDate: DateTime(2023, 5, 1),
    updateDate: DateTime(2024, 1, 1),
    status: true,
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
  contractID: "1",
  userID: "1",
  createdDate: DateTime.now(),
  updatedDate: DateTime.now(),
  status: true,
  note: "",
  url: "", cardHolderID: '', parent: '', type: 'A',
  );