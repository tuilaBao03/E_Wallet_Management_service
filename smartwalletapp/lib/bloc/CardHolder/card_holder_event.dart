import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:smartwalletapp/request/edit_cardholder_request.dart';
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
  CreateClientV4Body cardHolder;
  String token;
  
  AddCardHolderEvent(this.cardHolder,this.token);
}

class EditCardHolderEvent extends CardHolderEvent{
  final EditClientV6 request;
  String token;
  EditCardHolderEvent(this.request,this.token); 
}
class LoadContractListEvent extends CardHolderEvent{
}
