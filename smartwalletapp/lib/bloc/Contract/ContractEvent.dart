import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/models/create_contractV2_request.dart';

abstract class ContractEvent{}


class ContractInitialEvent extends ContractEvent{
  String token;
  CreateCardHolderRequest cardHolder;
  ContractInitialEvent(this.token, this.cardHolder);
}

class GiveContractBySearch extends ContractEvent{
  String token;
  CreateCardHolderRequest cardHolder;
  String searchText;
  GiveContractBySearch(this.token,this.cardHolder,this.searchText);
}

class AddContractEvent extends ContractEvent{
  String token;
  CreateCardHolderRequest cardHolder;
  AddContractEvent(this.token, this.cardHolder);

}
class AddContractV2Event extends ContractEvent{
  String token;
  CreateCardHolderRequest cardHolder;
  CreateContractRequest contract;
  AddContractV2Event(this.token,this.cardHolder,this.contract);

}
class AddCardEvent extends ContractEvent{
  String token;
  CreateCardHolderRequest cardHolder;
  CreateContractRequest contract;
  CreateContractV2Request contractV2; 
  AddCardEvent(this.token,this.cardHolder,this.contract,this.contractV2);

}
