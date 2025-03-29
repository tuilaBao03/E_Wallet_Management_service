import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';

abstract class CardHolderEvent{}

class CardHolderInitialEvent extends CardHolderEvent{
  String token;
  String searchText;
  int page;
  bool showContractList;
  int size;
  GetCardHolderResponse cardHolder;
  CardHolderInitialEvent(this.token, this.searchText, this.page, this.showContractList,this.cardHolder,this.size);
}

class AddCardHolderEvent extends CardHolderEvent{
  CreateCardHolderRequest cardHolder;
  String token;
  AddCardHolderEvent(this.cardHolder,this.token);
}

class EditContractEvent extends CardHolderEvent{
  
}

class LoadContractListEvent extends CardHolderEvent{
}
