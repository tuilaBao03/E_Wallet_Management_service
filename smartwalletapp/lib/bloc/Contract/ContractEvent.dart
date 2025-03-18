import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/contractV2.dart';

abstract class ContractEvent{}


class ContractInitialEvent extends ContractEvent{
  String token;
  CardHolder cardHolder;
  ContractInitialEvent(this.token, this.cardHolder);
}
class GiveContractBySearch extends ContractEvent{
  String token;
  CardHolder cardHolder;
  String searchText;
  GiveContractBySearch(this.token,this.cardHolder,this.searchText);
}

class GiveListContractV2Event extends ContractEvent{
  List<Contract> contracts;
  Contract contract;
  String token;
  GiveListContractV2Event(this.contract,this.token,this.contracts);
}

class GiveListCardEvent extends ContractEvent{
  List<Contract> contracts;
  List<ContractV2> contractsV2;
  ContractV2 contractV2;
  String token;
  GiveListCardEvent(this.contractV2,this.token, this.contracts,this.contractsV2);
}

class AddContractEvent extends ContractEvent{
  String token;
  CardHolder cardHolder;
  AddContractEvent(this.token, this.cardHolder);

}
class AddContractV2Event extends ContractEvent{
  String token;
  CardHolder cardHolder;
  Contract contract;
  AddContractV2Event(this.token,this.cardHolder,this.contract);

}
class AddCardEvent extends ContractEvent{
  String token;
  CardHolder cardHolder;
  Contract contract;
  ContractV2 contractV2; 
  AddCardEvent(this.token,this.cardHolder,this.contract,this.contractV2);

}
