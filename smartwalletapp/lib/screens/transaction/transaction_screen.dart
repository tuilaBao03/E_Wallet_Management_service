

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/responsive.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_detail.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_list.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../general/header.dart';




class TransactionScreen extends StatefulWidget {
  final bool isAuth;
  const TransactionScreen({super.key,
    required this.isAuth,

  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final HashSet<String> objectColumnNameOfTransaction = HashSet.from([
    "TransactionID",
    "date",
    "budget",
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
  final CardInfo cardInfo = CardInfo(
    bankName: "",
    balance: 1328,
    svgSrc: "assets/logos/xynsh-rect.svg",
    color: primaryColor,
    CardID: '0',
    userId: '0',
    typeCard: "",
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
  bool selectTranDetail = false;
  
  void updateTranDetail(Transaction tran){
   setState(() {
     selectedTransaction = tran;
     selectTranDetail = true;
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
            Header(title: "Transaction",user: user, isAuth: widget.isAuth,),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TransactionList(
                        object: demoTransactionList,
                        objectColumnName: objectColumnNameOfTransaction,
                        title: 'TranList',
                        onDetailSelected: updateTranDetail, currentPage: true,
                        cardInfo: cardInfo,),
                      if(!Responsive.isDesktop(context))
                        SizedBox(height: defaultPadding),
                      if(!Responsive.isDesktop(context) && selectTranDetail == true)
                        TransactionDetail(object: selectedTransaction, title: 'DetailTransaction',)
                    ],
                  ),
                ),
                if(Responsive.isDesktop(context) && selectTranDetail == true)
                  SizedBox(width: defaultPadding),
                if(Responsive.isDesktop(context) && selectTranDetail == true)
                Expanded(
                  flex: 2,
                  child: TransactionDetail(object: selectedTransaction, title: 'DetailTransaction',)
                  
                ),
                

              ],
            )
          ],
        ),
      ),
    );
  }
}
