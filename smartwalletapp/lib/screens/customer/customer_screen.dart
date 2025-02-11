
// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:collection';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/screens/card/components/card_detail.dart';
import 'package:smartwalletapp/screens/card/components/card_list.dart';
import 'package:smartwalletapp/screens/customer/components/customer_detail.dart';
import 'package:smartwalletapp/screens/customer/components/customer_list.dart';
import 'package:smartwalletapp/screens/transaction/components/Transaction_detail.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_list.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../general/header.dart';


class CustomerScreen extends StatefulWidget {

  final List<User> users;
  final List<Transaction> trans;
  final List<CardInfo> cards; 
  final bool isAuth;
  final User user;
  const CustomerScreen({super.key, required this.isAuth, required this.user, required this.users, required this.trans, required this.cards});

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final HashSet<String> objectColumnNameOfUser = HashSet.from([
    "FirstName",
    "LastName",
    "Detail",
  ]);
  final HashSet<String> objectColumnNameOfCard = HashSet.from([
    "CardId",
    "Detail"
  ]);
  final HashSet<String> objectColumnNameOfTransaction = HashSet.from([
    "TransactionID",
    "date",
    "Detail"
  ]);

  User selectedUser = User(
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
  CardInfo selectedCard = CardInfo(
    bankName: "ChineBank",
    balance: 1328,
    svgSrc: "assets/logos/xynsh-rect.svg",
    color: primaryColor,
    CardID: '1',
    userId: '',
    typeCard: "DebitCard",
    createdDate: DateTime.now(),
    updateDate: DateTime.now(),
    status: true,
    contractID: "1",
  );
  Transaction selectedTransaction = Transaction(
    icon: "assets/logos/zybank-rect.svg",
    bankName: "zybank",
    date: DateTime.now(),
    budget: "100000",
    typeMoney:"VNĐ",
    typeTransaction: true, 
    transactionId: '1', cardId: '1'
  );

  bool SelectUserDetail = false;
  bool SelectCardDetail = false;
  bool SelectTranDetail = false;
  bool SelectCardList = false;
  bool SelectTranList = false;

  void updateUserDetail(User user) {
    setState(() {
      selectedUser = user;
      SelectUserDetail = true;
      SelectCardList = true;
      SelectCardDetail = false;
      SelectTranList = false;
    });
  }
  void updateCardDetail(CardInfo card ){
    setState((){
      selectedCard = card;
      SelectTranList = true;
      SelectCardDetail = true;
      SelectTranDetail = false;
    });
  }
  void updateTranDetail(Transaction tran){
   setState(() {
     selectedTransaction = tran;
     SelectTranList = true;
     SelectTranDetail = true;
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
            Header(title: AppLocalizations.of(context).translate("Customer"),
            user: widget.user,
            isAuth: widget.isAuth),
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
                                child: CustomerList(
                                object: demoCustomersList,
                                objectColumnName: objectColumnNameOfUser,
                                title: 'cusList',
                                onDetailSelected: updateUserDetail,
                              ),
                              ),
                              if(Responsive.isDesktop(context) && SelectUserDetail == true)
                                SizedBox(width: defaultPadding),
                              if(Responsive.isDesktop(context) && SelectUserDetail == true)
                                Expanded(
                                  flex: 2,
                                  child:  CustomerDetail(
                                      object: selectedUser,
                                      isImage: true,
                                      title: 'CustomerDetail',
                                      isActive: true,
                                      isUpdate: false,
                                    ),
                              ),
                              ],
                          ),
                          SizedBox(height: defaultPadding),
                          if(!Responsive.isDesktop(context) && SelectUserDetail == true)
                            CustomerDetail(
                                object: selectedUser,
                                isImage: true,
                                title: 'CustomerDetail',
                                isActive: true,
                                isUpdate: false,
                              ),
                          SizedBox(height: defaultPadding),
                          if (SelectCardList)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CardList(
                                  object: MyCards,
                                  objectColumnName: objectColumnNameOfCard,
                                  title: 'MyCard',
                                  onDetailSelected: updateCardDetail,
                                  user: selectedUser,),
                              ),
                              if(Responsive.isDesktop(context) && SelectCardDetail)
                                SizedBox(width: defaultPadding),
                              if(Responsive.isDesktop(context) && SelectCardDetail)
                                Expanded(
                                  flex: 2,
                                  child:  CardDetail(
                                    object: selectedCard,
                                    isImage: true,
                                    title: 'CardDetail',
                                    isActive: true,
                                    isUpdate: false,
                                  ),
                              )],
                            ),
                          SizedBox(height: defaultPadding),
                          if (!Responsive.isDesktop(context) && SelectCardDetail)
                          CardDetail(
                              object: selectedCard,
                              isImage: true,
                              title: 'CardDetail',
                              isActive: true,
                              isUpdate: false,
                            ),
                          SizedBox(height: defaultPadding),
                          if (SelectTranList)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: TransactionList(
                                  object: demoTransactionList, 
                                  objectColumnName: objectColumnNameOfTransaction, 
                                  title: "TranList", 
                                  onDetailSelected: updateTranDetail, 
                                  cardInfo: selectedCard, currentPage: false,),
                              ),
                              if(Responsive.isDesktop(context) && SelectTranDetail)
                                SizedBox(width: defaultPadding),
                              if(Responsive.isDesktop(context) && SelectTranDetail)
                                Expanded(
                                  flex: 2,
                                  child:  TransactionDetail(
                                    object: selectedTransaction,
                                    title: 'DetailTransaction',
                                  ),
                              )],
                            ),
                          SizedBox(height: defaultPadding),
                          if (!Responsive.isDesktop(context) && SelectTranDetail)
                            TransactionDetail(
                                object: selectedTransaction,
                                title: 'DetailTransaction',
                              ),
                          SizedBox(height: defaultPadding), 
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

