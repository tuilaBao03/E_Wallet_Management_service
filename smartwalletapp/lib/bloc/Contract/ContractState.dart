import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/contractV2.dart';

abstract class ContractState {}

class ContractInitialState extends ContractState{
  
}

class ContractLoadingState extends ContractState{

  ContractLoadingState();
}

class ContractLoadedState extends ContractState{
  final List<Contract> contracts;
  final List<ContractV2> contractsV2s;
  final List<Cards> cards;

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