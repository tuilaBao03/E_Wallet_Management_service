// ignore_for_file: unused_element
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/Contract/ContractEvent.dart';
import 'package:smartwalletapp/bloc/Contract/ContractState.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';
import 'package:smartwalletapp/response/contract/give_contract_response.dart';

class ContractBloc extends Bloc<ContractEvent,ContractState> {
  ContractBloc(): super(ContractInitialState()){
    on<ContractInitialEvent>(_contractInitial);

  } 
  void _contractInitial(ContractInitialEvent event, Emitter<ContractState> emit) async {
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      ApiResult apiResult = await contractRepository.giveContractByCLient(event.cardHolder.identityCardNumber, event.token);
      if(apiResult.code == 0){
        List<GiveContractResponse> contractList = apiResult.result;
      }
      
      
      emit(ContractLoadedState(contractList,[],[])); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(ContractErrorState('Failed to contract list')); // Ensure an exception is thrown
    }
  }
  void _giveListContract(GiveContractBySearch event, Emitter<ContractState> emit) async {
    try {
      emit(ContractLoadingState());
      List<CreateContractRequest> contracts = [];

      contracts = contractList.where((contract)=>contract.clientIdentifier == event.cardHolder.identityCardNumber
       && contract.contractName.toLowerCase().contains(event.searchText.toLowerCase())).toList();

      emit(ContractLoadedState([],[],[])); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(ContractErrorState('Failed to contract list')); // Ensure an exception is thrown
    }
  }
  }


