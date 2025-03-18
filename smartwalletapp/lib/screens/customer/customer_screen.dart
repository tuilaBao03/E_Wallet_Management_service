
// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:collection';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppBloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/screens/contract/components/contract_list.dart';
import 'package:smartwalletapp/screens/customer/components/customer_list.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../general/header.dart';


class CustomerScreen extends StatefulWidget {

  final String token;
  final List<CardHolder> cardHolders;
  final bool isAuth;
  final User user;
  final Function(Locale) onLanguageChange;
  const CustomerScreen({
    super.key, 
    required this.isAuth, 
    required this.user,  
    required this.cardHolders,  
    required this.onLanguageChange, required this.token});
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final HashSet<String> objectColumnNameOfUser = HashSet.from([
    "FirstName",
    "LastName",
    "Detail",
    "ContractList"
  ]);
  User selectedUser = selectedUserInittial;
  CardHolder selectedcardHolder = emptyCardHolder;
  bool SelectContractList = false;

  int page = 1;
  int pageAmount = 1;

  void updateCardHolder_contract(CardHolder cardHolder) {
    setState(() {
      context.read<MainAppBloc>().add(giveContractListEvent(cardHolder,page-1));
      selectedcardHolder  = cardHolder;
      SelectContractList = true;
    });
  }
  @override
  void initState() {

    super.initState();
    context.read<MainAppBloc>().add(initializationEvent(page-1));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: AppLocalizations.of(context).translate("Customer"),
            user: widget.user,
            isAuth: widget.isAuth, onLanguageChange: widget.onLanguageChange),
            SizedBox(height: defaultPadding),
            Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: 
                                  CustomerList(
                                      object: widget.cardHolders,
                                      objectColumnName: objectColumnNameOfUser,
                                      title: 'cusList',
                                      onCustomer_Contracts: updateCardHolder_contract, token: widget.token,
                                    ),),
                                if(Responsive.isDesktop(context) && SelectContractList)
                                  SizedBox(width: defaultPadding),
                                if(Responsive.isDesktop(context) && SelectContractList)
                                Expanded(
                                  flex: 1,
                                  child: 
                                  ContractList(
                                    title: "Contract",
                                    cardHolder: selectedcardHolder, isContractScreent: false, token: widget.token,),)
                              ],
                            ),
                          SizedBox(height: defaultPadding),
                          if(!Responsive.isDesktop(context) && SelectContractList)
                            ContractList(
                                    title: "Contract",
                                    cardHolder: selectedcardHolder, isContractScreent: false, token: widget.token,),
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ) 
    );
  }
}

