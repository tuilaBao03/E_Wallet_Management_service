// ignore_for_file: unused_element
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/Contract/ContractEvent.dart';
import 'package:smartwalletapp/bloc/Contract/ContractState.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/contractV2.dart';
import 'package:smartwalletapp/repository/cardRepository.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';

class ContractBloc extends Bloc<ContractEvent,ContractState> {
  ContractBloc(): super(ContractInitialState()){
    on<ContractInitialEvent>(_contractInitial);
    on<GiveListContractV2Event>(_giveListContractV2);
    on<GiveListCardEvent>(_giveListCard);

  } 
  void _contractInitial(ContractInitialEvent event, Emitter<ContractState> emit) async {
    try {
      emit(ContractLoadingState());
      List<Contract> contracts = [];
      contracts = contractList.where((contract)=>contract.clientIdentifier == event.cardHolder.identityCardNumber ).toList();

      emit(ContractLoadedState(contracts,[],[])); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(ContractErrorState('Failed to contract list')); // Ensure an exception is thrown
    }
  }
  void _giveListContract(GiveContractBySearch event, Emitter<ContractState> emit) async {
    try {
      emit(ContractLoadingState());
      List<Contract> contracts = [];

      contracts = contractList.where((contract)=>contract.clientIdentifier == event.cardHolder.identityCardNumber
       && contract.contractName.toLowerCase().contains(event.searchText.toLowerCase())).toList();

      emit(ContractLoadedState(contracts,[],[])); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(ContractErrorState('Failed to contract list')); // Ensure an exception is thrown
    }
  }
  void _giveListContractV2(GiveListContractV2Event event, Emitter<ContractState> emit) async{
    try{
      emit(ContractLoadingState());
      List<ContractV2> contractsV2s = [];
      ContractRepository contractRepository = ContractRepository();
      ApiResult apiResult = await contractRepository.giveContractV2("", 1, event.token, event.contract);
      if(apiResult.code == 0 ){
        contractsV2s = apiResult.result;
        emit(ContractLoadedState(event.contracts, contractsV2s, []));
      }
      else{
        emit(ContractErrorState(apiResult.message));
      }
    }catch(e){
      print("_giveListContractV2 $e");
      emit(ContractErrorState('Failed to fetch contract V2 list')); // Ensure an exception is thrown
    }
  }
  void _giveListCard(GiveListCardEvent event, Emitter<ContractState> emit) async{
    try{
      emit(ContractLoadingState());
      List<Cards> cards = [];
      CardRepository cardR = CardRepository();
      ApiResult apiResult = await cardR.giveCardByContractV2(event.token, event.contractV2);
      if(apiResult.code == 0 ){
          cards = apiResult.result;
          emit(ContractLoadedState(event.contracts, event.contractsV2, cards));
      }
      else{
        emit(ContractErrorState(apiResult.message));
      }
    }catch(e){
      print("_giveListContractV2 $e");
      emit(ContractErrorState('Failed to fetch contract V2 list')); // Ensure an exception is thrown
    }
  }

  // void _contractInitial(ContractInitialEvent event, Emitter<ContractState> emit) async {
  //   try {
  //     List<Contract> contracts = [];
  //     contracts = contractList.where((contract)=>contract.clientIdentifier == event.cardHolder.identityCardNumber && contract.contractName=="A").toList();

  //     emit(ContractLoadedState(contracts,[],[])); // Ensure a value is returned
  //   } catch (e) {
  //     print("_giveUserList $e");
  //     emit(ContractErrorState('Failed to fetch user list')); // Ensure an exception is thrown
  //   }
  // }
}