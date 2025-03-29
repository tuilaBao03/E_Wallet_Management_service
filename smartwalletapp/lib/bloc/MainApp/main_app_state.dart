// ignore_for_file: file_names, camel_case_types, duplicate_ignore
import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:smartwalletapp/request/user.dart';

abstract class MainAppState{}

class MainInitial extends MainAppState{}


class LoadingState extends MainAppState{

}
class SuccessState extends MainAppState{
  final String message;
  SuccessState(this.message);
}


class giveCardHolderListState extends MainAppState{
  final List<CreateCardHolderRequest> cardHolders;
  final int page;
  final int pageAmount;
  giveCardHolderListState(this.cardHolders, this.page, this.pageAmount);
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
  final CreateCardHolderRequest cardHolder;
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

// class GiveCardListState extends MainAppState{
//   final List<Card_Time> list;
//   GiveCardListState(this.list);
// }
class MainAppErrorState extends MainAppState{
  final String message;
  MainAppErrorState(this.message);
}
