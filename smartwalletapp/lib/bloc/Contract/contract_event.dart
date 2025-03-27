
import 'package:smartwalletapp/models/create_card_request.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/models/create_contractV2_request.dart';

abstract class ContractEvent{}


class ContractInitialEvent extends ContractEvent{
  String token;
  int page;
  String searchText;
  ContractInitialEvent(this.token, this.page, this.searchText);
}

class AddLibContractEvent extends ContractEvent{
  String token;
  CreateContractRequest contract;
  AddLibContractEvent(this.token, this.contract);

}
class AddIssueContractV2Event extends ContractEvent{
  String token;
  CreateContractRequest contract;
  AddIssueContractV2Event(this.token,this.contract);

}
class AddCardContractEvent extends ContractEvent{
  String token;
  CreateContractV2Request contract; 
  AddCardContractEvent(this.token,this.contract);

}
