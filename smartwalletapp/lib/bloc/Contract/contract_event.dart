
import 'package:smartwalletapp/request/create_contract_card_request.dart';
import 'package:smartwalletapp/request/create_contract_liab_request.dart';
import 'package:smartwalletapp/request/create_contract_issue_request.dart';
import 'package:smartwalletapp/request/edit_contract_request.dart';

abstract class ContractEvent{}


class ContractInitialEvent extends ContractEvent{
  int size;
  String token;
  int page;
  String searchText;
  ContractInitialEvent(this.token, this.page, this.searchText, this.size);
}

class GetContractDetailEvent extends ContractEvent{
  String contractNumber;
  String token;
  GetContractDetailEvent(this.contractNumber,this.token);
}

class GetContractDetailByClientNumberEvent extends ContractEvent{
  String idCardholder;
  String token;
  GetContractDetailByClientNumberEvent(this.idCardholder,this.token);
}

class AddLibContractEvent extends ContractEvent{
  String token;
  CreateContractLiabRequest contract;
  AddLibContractEvent(this.token, this.contract);

}
class AddIssueContractV2Event extends ContractEvent{
  String token;
  CreateContractV4ReqV2 contract;
  AddIssueContractV2Event(this.token,this.contract);

}
class AddCardContractEvent extends ContractEvent{
  String token;
  CreateCardV3 contract; 
  AddCardContractEvent(this.token,this.contract);

}

class EditContractEvent extends ContractEvent{
  String token;
  EditContractV4 request;
  EditContractEvent(this.token, this.request);

}


class SetStatusEvent extends ContractEvent{
  String token;
  String contractIdentity;
  SetStatusEvent(this.token, this.contractIdentity);
}

class ActivateEvent extends ContractEvent{
  String token;
  String contractIdentity;
  ActivateEvent(this.token,this.contractIdentity);
}
