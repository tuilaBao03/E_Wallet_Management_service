// ignore_for_file: camel_case_types, file_names
import 'package:smartwalletapp/request/create_contract_liab_request.dart';
import 'package:smartwalletapp/request/user.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';

abstract class MainAppEvent{}

class initializationEvent extends MainAppEvent{
  final int page;
  initializationEvent(this.page);
}

class giveContractListEvent extends MainAppEvent{
    final GetCardHolderResponse cardHolder;
    final int page;
    giveContractListEvent(this.cardHolder, this.page);
}

class giveTransactionEvent extends MainAppEvent{
  final CreateContractLiabRequest contract;

  giveTransactionEvent(this.contract,);
}

class UpdateUserInforEvent  extends MainAppEvent{
  final User user;
  final String token;
  UpdateUserInforEvent (this.user, this.token);
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
// class AddCardHolderEvent extends MainAppEvent{
//   final CreateCardHolderRequest cardHolder;
//   final String token;

//   AddCardHolderEvent(
//     this.cardHolder, this.token
//   );

// }

// class AddContractEvent extends MainAppEvent{
//   final CreateContractRequest contract;
//   final String token;

//   AddContractEvent(
//     this.contract, this.token
//   );

// }

// class LockOrUnLockCardEvent extends MainAppEvent{
//   String token;
//   CreateCardRequest card;
//   bool newStatus;
//   LockOrUnLockCardEvent(this.token,this.newStatus,this.card);

// }

// class LockOrUnLockContractEvent extends MainAppEvent{
//   String token;
//   bool newStatus;
//   CreateContractRequest contract;
//   LockOrUnLockContractEvent(this.token, this.newStatus,this.contract);
// }

class LogoutEvent extends MainAppEvent{

}

class GiveCard_TimeListEvent extends MainAppEvent{
  final DateTime start;
  final DateTime end;
  GiveCard_TimeListEvent (this.start, this.end);
}

