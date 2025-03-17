// ignore_for_file: file_names, camel_case_types, duplicate_ignore
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/models/user.dart';

import '../../repository/dashboardRepository.dart';

abstract class MainAppState{}

class MainInitial extends MainAppState{}


class LoadingState extends MainAppState{

}
class SuccessState extends MainAppState{
  final String message;
  SuccessState(this.message);
}
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
  final int page;
  final int pageAmount;
  giveCardHolderListState(this.cardHolders, this.page, this.pageAmount);
}

class giveContractsListState extends MainAppState{
  final List<Contract> contracts;
  giveContractsListState(this.contracts);
}


class UpdateUserSuccessState extends MainAppState{
  final User user;
  UpdateUserSuccessState(this.user);
}
class CreateCardHolderSuccessState extends MainAppState{
  String message;
  CreateCardHolderSuccessState(this.message);
}
class UpdateCardHolderSuccessState extends MainAppState{
  final CardHolder cardHolder;
  UpdateCardHolderSuccessState(this.cardHolder);
}

class UpdateStatusContractSuccessState extends MainAppState{
  final bool newState;
  UpdateStatusContractSuccessState(this.newState);
}
class UpdateStatusCardSuccessState extends MainAppState{
  final bool newState;
  UpdateStatusCardSuccessState(this.newState);
}

class UpdateLimitCardSuccessState extends MainAppState{
  final double newLimit;
  UpdateLimitCardSuccessState(this.newLimit);
}
class LogoutSuccess extends MainAppState{
}

class GiveCardListState extends MainAppState{
  final List<Card_Time> list;
  GiveCardListState(this.list);
}
class MainAppErrorState extends MainAppState{
  final String message;
  MainAppErrorState(this.message);
}
