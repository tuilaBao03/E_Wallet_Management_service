
// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:collection';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppBloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/models/card.dart';
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

  final List<Transaction> trans;
  final List<CardInfo> cards;
  final List<CardHolder> cardHolders;
  final List<Contract> contracts;
  final bool isAuth;
  final User user;
  final Function(Locale) onLanguageChange;
  const CustomerScreen({
    super.key, 
    required this.isAuth, 
    required this.user,  
    required this.trans, 
    required this.cards, 
    required this.cardHolders, 
    required this.contracts, 
    required this.onLanguageChange});
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
  final HashSet<String> objectColumnNameOfContract = HashSet.from([
    "ContractID",
    "date",
    "Detail",
    "cardList",
  ]);
  final HashSet<String> objectColumnNameOfCard = HashSet.from([
    "CardId",
    "Detail",
  ]);
  User selectedUser = selectedUserInittial;
  CardHolder selectedcardHolder = selectedcardHolderInittial;
  CardInfo selectedCard = selectedCardInittial;
  Contract selectedContract = selectedContractInittial;


  bool SelectCardList = false;
  bool SelectTranList = false;
  bool SelectContractList = false;

  int page = 1;
  int pageAmount = 1;

  void updateCardHolder_contract(CardHolder cardHolder) {
    setState(() {
      context.read<MainAppBloc>().add(giveContractListEvent(cardHolder,page-1));
      selectedcardHolder  = cardHolder;
      SelectContractList = true;
      SelectTranList = false;
      SelectCardList = false;
    });
  }
  void updateContract_card(Contract contract){
    context.read<MainAppBloc>().add(giveCardListEvent(contract));
    selectedContract = contract;
    SelectCardList =true;
    SelectTranList = false;
  }
  void updateContract_tran(Contract contract){
    context.read<MainAppBloc>().add(giveTransactionEvent(contract));
    selectedContract = contract;
    SelectCardList =false;
    SelectTranList = true;
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
                                      onCustomer_Contracts: updateCardHolder_contract,
                                    ),),
                                if(Responsive.isDesktop(context) && SelectContractList)
                                  SizedBox(width: defaultPadding),
                                if(Responsive.isDesktop(context) && SelectContractList)
                                Expanded(
                                  flex: 1,
                                  child: 
                                  ContractList(
                                    object: widget.contracts,
                                    objectColumnName: objectColumnNameOfContract,
                                    title: "Contract",
                                    onContract_CardList: updateContract_card,
                                    cardHolder: selectedcardHolder, isContractScreent: false, cards: MyCards, trans: [],),)
                              ],
                            ),
                          SizedBox(height: defaultPadding),
                          if(!Responsive.isDesktop(context) && SelectContractList)
                            ContractList(
                                    object: widget.contracts,
                                    objectColumnName: objectColumnNameOfContract,
                                    title: "Contract",
                                    onContract_CardList: updateContract_card,
                                    cardHolder: selectedcardHolder, isContractScreent: false, cards: MyCards, trans: [],),
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

