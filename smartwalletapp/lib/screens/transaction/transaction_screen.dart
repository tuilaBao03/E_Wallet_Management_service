

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/responsive.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_detail.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_list.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../general/header.dart';
import '../main/components/classInitial.dart';




class TransactionScreen extends StatefulWidget {
  final bool isAuth;
  final User user;
  final Function(Locale) onLanguageChange;
  const TransactionScreen({super.key,
    required this.isAuth, required this.user, required this.onLanguageChange,

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
  
  Contract selectedContract = selectedContractInittial;
  Transaction selectedTransaction = selectedTransactionInittial;
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
            Header(title: "Transaction",user: widget.user, isAuth: widget.isAuth, onLanguageChange: widget.onLanguageChange,),
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
                        contract: selectedContract,),
                      if(!Responsive.isDesktop(context))
                        SizedBox(height: defaultPadding),
                      if(!Responsive.isDesktop(context) && selectTranDetail == true)
                        TransactionDetail(object: selectedTransaction, title: 'DetailTransaction')
                    ],
                  ),
                ),
                if(Responsive.isDesktop(context) && selectTranDetail == true)
                  SizedBox(width: defaultPadding),
                if(Responsive.isDesktop(context) && selectTranDetail == true)
                Expanded(
                  flex: 2,
                  child: TransactionDetail(object: selectedTransaction, title: 'DetailTransaction')
                  
                ),
                

              ],
            )
          ],
        ),
      ),
    );
  }
}
