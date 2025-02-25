// ignore_for_file: file_names, camel_case_types, duplicate_ignore
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/models/user.dart';

import '../../repository/DashboardRepository.dart';

abstract class MainAppState{}

class MainInitial extends MainAppState{}

// ignore: camel_case_types
class giveCardListState extends MainAppState{
    final List<CardInfo> cardInfo;
    giveCardListState(this.cardInfo);
}

class giveTransactionState extends MainAppState{
  final List<Transaction> trans;
  giveTransactionState(this.trans);
}

class giveCardHolderListState extends MainAppState{
  final List<CardHolder> cardHolders;
  giveCardHolderListState(this.cardHolders);
}

class giveContractsListState extends MainAppState{
  final List<Contract> contracts;
  giveContractsListState(this.contracts);
}

class MainAppErrorState extends MainAppState{
  final String error;
  MainAppErrorState(this.error);
}

class UpdateUserSuccessState extends MainAppState{
  final User user;
  UpdateUserSuccessState(this.user);
}

class LogoutSuccess extends MainAppState{
}

class GiveCardListState extends MainAppState{
  final List<Card_Time> list;
  GiveCardListState(this.list);
}
