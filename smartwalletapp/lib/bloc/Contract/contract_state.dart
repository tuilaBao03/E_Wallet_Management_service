
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

abstract class ContractState {}

class ContractInitialState extends ContractState{
  
}

class ContractLoadingState extends ContractState{

  ContractLoadingState();
}

class ContractLoadedState extends ContractState{
  final List<GetContractResponse> libContracts;
  final int page;
  final int pageAmount;

  ContractLoadedState(this.libContracts,this.page,this.pageAmount);
}

class ContractSuccessState extends ContractState{
  String mess;
  ContractSuccessState(this.mess);
}

class ContractErrorState extends ContractState{
  String mess;
  ContractErrorState(this.mess);
}