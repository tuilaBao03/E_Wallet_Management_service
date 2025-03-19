

// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/screens/contract/components/contract_list.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';


import '../../constants.dart';
import '../../models/user.dart';
import '../general/header.dart';




class ContractScreen extends StatefulWidget {
  
  final bool isAuth;
  final String token;
  final User user;
  final Function(Locale) onLanguageChange;
  const ContractScreen({super.key,
    required this.isAuth, required this.user, required this.onLanguageChange, required this.token,

  });

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  final HashSet<String> objectColumnNameOfContract = HashSet.from([
    "ContractID",
    "date",
    "Detail",
    "cardList",
    "TranList"
  ]);

  CreateContractRequest selectedContract = selectedContractInittial;
  bool selectContractDetail = false;

  void updateContractDetail(CreateContractRequest contract){
   setState(() {
     selectedContract = contract;
     selectContractDetail = true;
   });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: "Contract",user: widget.user, isAuth: widget.isAuth, onLanguageChange: widget.onLanguageChange,),
            SizedBox(height: defaultPadding),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      ContractList(
                        title: 'ContractList',
                        cardHolder: emptyCardHolder, isContractScreent: true, token: widget.token,),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
