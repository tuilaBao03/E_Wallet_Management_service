

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/responsive.dart';
import 'package:smartwalletapp/screens/contract/components/contract_detail.dart';
import 'package:smartwalletapp/screens/contract/components/contract_list.dart';


import '../../constants.dart';
import '../../models/user.dart';
import '../general/header.dart';




class ContractScreen extends StatefulWidget {
  final bool isAuth;
  final User user;
  const ContractScreen({super.key,
    required this.isAuth, required this.user,

  });

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  final HashSet<String> objectColumnNameOfContract = HashSet.from([
    "ContractID",
    "date",
    "Detail"
  ]);
  final User user = User(
    username: "",
    password: "",
    phoneNumber: "",
    homeAddress: "",
    companyAddress: "",
    lastName: "",
    firstName: "",
    avatar: "",
    email: '', userId: '', 
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    );
  
  
  Contract selectedContract = Contract(
  contractID: "1",
  userID: "1",
  createdDate: DateTime.now(),
  updatedDate: DateTime.now(),
  status: true,
  note: "",
  url: "https://example.com/contracts/C12345",
  );
  bool selectContractDetail = false;
  
  void updateContractDetail(Contract contract){
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
            Header(title: "Contract",user: user, isAuth: widget.isAuth,),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      ContractList(
                        object: contractlist,
                        objectColumnName: objectColumnNameOfContract,
                        title: 'ContractList',
                        onDetailSelected: updateContractDetail, currentPage: true,
                        user: user,),
                      if(!Responsive.isDesktop(context))
                        SizedBox(height: defaultPadding),
                      if(!Responsive.isDesktop(context) && selectContractDetail == true)
                        ContractDetail(object: selectedContract, title: 'ContractDetail',)
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
                if(Responsive.isDesktop(context) && selectContractDetail == true)
                Expanded(
                  flex: 2,
                  child: ContractDetail(object: selectedContract, title: 'ContractDetail',)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
