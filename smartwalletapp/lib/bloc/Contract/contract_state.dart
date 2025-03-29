
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

abstract class ContractState {}

class ContractInitialState extends ContractState{
  
}

class ContractLoadingState extends ContractState{

  ContractLoadingState();
}

class ContractLoadedState extends ContractState{
  final List<GetContractResponseCustom> libContracts;
  final int page;
  final int pageAmount;
  final int size;

  ContractLoadedState(this.libContracts,this.page,this.pageAmount, this.size);
}

class GetDetailContractState extends ContractState{
  final GetContractResponse contract;
  GetDetailContractState(this.contract);
}

class ContractSuccessState extends ContractState{
  String mess;
  ContractSuccessState(this.mess);
}

class ContractErrorState extends ContractState{
  String mess;
  ContractErrorState(this.mess);
}