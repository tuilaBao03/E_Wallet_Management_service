// ignore_for_file: camel_case_types, file_names
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/user.dart';

abstract class MainAppEvent{}

class initializationEvent extends MainAppEvent{
}

class giveContractListEvent extends MainAppEvent{
    final CardHolder cardHolder;
    giveContractListEvent(this.cardHolder);
}

class giveCardListEvent extends MainAppEvent{
    final Contract contract;
    giveCardListEvent(this.contract);
}

class giveTransactionEvent extends MainAppEvent{
  final Contract contract;
  giveTransactionEvent(this.contract);
}

class UpdateUserInforEvent  extends MainAppEvent{
  final User user;
  final String token;
  UpdateUserInforEvent (this.user, this.token);
}

class UpdateCardInforEvent  extends MainAppEvent{
  final CardInfo cardInfo;
  UpdateCardInforEvent(this.cardInfo); 

}

class UpdateStatusUserEvent  extends MainAppEvent{
  final bool newStatus;
  UpdateStatusUserEvent(this.newStatus);

}

class UpdateStatusCardEvent  extends MainAppEvent{
  final bool newStatus;
  UpdateStatusCardEvent(this.newStatus);

}

class UpdateStatusContractEvent  extends MainAppEvent{
  final bool newStatus;
  UpdateStatusContractEvent(this.newStatus);

}



// create 
class AddCardHolderEvent extends MainAppEvent{
  final String phoneNumber;
  final String homeAddress;
  final String companyAddress;
  final String lastName;
  final String firstName;
  final String avatar;
  final String email;
  final String cardHolderId;
  AddCardHolderEvent(
    this.phoneNumber,
    this.homeAddress,
    this.companyAddress,
    this.lastName,
    this.firstName,
    this.avatar,
    this.email,
    this.cardHolderId,
  );

}

class AddCardEvent extends MainAppEvent{

}

class AddContractEvent extends MainAppEvent{

}

class LogoutEvent extends MainAppEvent{
}

class GiveCard_TimeListEvent extends MainAppEvent{
  final DateTime start;
  final DateTime end;
  GiveCard_TimeListEvent (this.start, this.end);
}

