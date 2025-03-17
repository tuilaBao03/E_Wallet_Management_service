// ignore_for_file: camel_case_types, file_names
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/user.dart';

abstract class MainAppEvent{}

class initializationEvent extends MainAppEvent{
  final int page;
  initializationEvent(this.page);
}

class giveContractListEvent extends MainAppEvent{
    final CardHolder cardHolder;
    final int page;
    giveContractListEvent(this.cardHolder, this.page);
}

class giveCardListEvent extends MainAppEvent{
    final Contract contract;
    giveCardListEvent(this.contract);
}

class giveTransactionEvent extends MainAppEvent{
  final Contract contract;

  giveTransactionEvent(this.contract,);
}

class UpdateUserInforEvent  extends MainAppEvent{
  final User user;
  final String token;
  UpdateUserInforEvent (this.user, this.token);
}

class UpdateCardInforEvent  extends MainAppEvent{
  final CardInfo cardInfo;
  final String token;
  UpdateCardInforEvent(this.cardInfo, this.token); 

}

class UpdateStatusUserEvent  extends MainAppEvent{
  final bool newStatus;
  final String token;
  UpdateStatusUserEvent(this.newStatus, this.token);

}

class UpdateNewLimitCardEvent  extends MainAppEvent{
  final double limit;
  final String token;
  UpdateNewLimitCardEvent(this.limit, this.token);

}

// create 
class AddCardHolderEvent extends MainAppEvent{
  final CardHolder cardHolder;
  final String token;

  AddCardHolderEvent(
    this.cardHolder, this.token
  );

}

class AddContractEvent extends MainAppEvent{
  final Contract contract;
  final String token;

  AddContractEvent(
    this.contract, this.token
  );

}

class LockOrUnLockCardEvent extends MainAppEvent{
  String token;
  CardInfo card;
  bool newStatus;
  LockOrUnLockCardEvent(this.token,this.newStatus,this.card);

}

class LockOrUnLockContractEvent extends MainAppEvent{
  String token;
  bool newStatus;
  Contract contract;
  LockOrUnLockContractEvent(this.token, this.newStatus,this.contract);
}

class LogoutEvent extends MainAppEvent{

}

class GiveCard_TimeListEvent extends MainAppEvent{
  final DateTime start;
  final DateTime end;
  GiveCard_TimeListEvent (this.start, this.end);
}

