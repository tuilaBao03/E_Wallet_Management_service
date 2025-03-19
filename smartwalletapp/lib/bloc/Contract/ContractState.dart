import 'package:smartwalletapp/models/create_card_request.dart';
import 'package:smartwalletapp/models/create_contractV2_request.dart';
import 'package:smartwalletapp/response/contract/give_contract_response.dart';

abstract class ContractState {}

class ContractInitialState extends ContractState{
  
}

class ContractLoadingState extends ContractState{

  ContractLoadingState();
}

class ContractLoadedState extends ContractState{
  final List<GiveContractResponse> contracts;
  final List<CreateContractV2Request> contractsV2s;
  final List<CreateCardRequest> cards;

  ContractLoadedState(this.contracts,this.contractsV2s, this.cards);
}

class ContractSuccessState extends ContractState{
  String mess;
  ContractSuccessState(this.mess);
}

class ContractErrorState extends ContractState{
  String mess;
  ContractErrorState(this.mess);
}