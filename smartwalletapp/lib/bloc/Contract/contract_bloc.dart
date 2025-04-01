// ignore_for_file: unused_element
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/bloc/Contract/contract_state.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

class ContractBloc extends Bloc<ContractEvent,ContractState> {
  ContractBloc(): super(ContractInitialState()){
    on<ContractInitialEvent>(_contractInitial);
    on<GetContractDetailEvent>(_getContractByContractNumber);
    on<AddLibContractEvent>(_createLiabContract);
    on<AddIssueContractV2Event>(_createIssueContract);
    on<AddCardContractEvent>(_createCardContract);
    on<EditContractEvent>(_editContract);

  } 
  void _contractInitial(ContractInitialEvent event, Emitter<ContractState> emit) async {
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      String search = event.searchText.toLowerCase().trim();
      if(search == ''){
        search = " ";
      }
      ApiResult apiResult = await contractRepository.giveAllContract(event.token, event.page, search, event.size);
      if(apiResult.code == 200){
        List<GetContractResponseCustom> contracts = apiResult.result;
        int page = apiResult.page;
        int pageAmount = apiResult.pageTotal;
        emit(ContractLoadedState(contracts,page,pageAmount,event.size)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("_giveUserList $e");
      // Ensure an exception is thrown
    }
  }

  void _getContractByContractNumber(GetContractDetailEvent event, Emitter<ContractState> emit) async {
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      print(event.contractNumber);
      ApiResult apiResult = await contractRepository.getContractByContractNumber(event.contractNumber, event.token);
      if(apiResult.code == 0){
        GetContractResponse contract = apiResult.result;
        emit(GetDetailContractState(contract)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("ContractBloc _getContractByContractNumber  $e");
      // Ensure an exception is thrown
    }
  }

  void _createLiabContract(AddLibContractEvent event, Emitter<ContractState> emit)async{
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      ApiResult apiResult = await contractRepository.createdLibContract(event.contract, event.token);
      if(apiResult.code == 0){
        emit(ContractSuccessState(apiResult.message)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("ContractBloc _getContractByContractNumber  $e");
      // Ensure an exception is thrown
    }
    }
  void _createIssueContract(AddIssueContractV2Event event, Emitter<ContractState> emit)async{
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      ApiResult apiResult = await contractRepository.createdIssueContract(event.contract, event.token);
      if(apiResult.code == 0){
        emit(ContractSuccessState(apiResult.message)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("ContractBloc _getContractByContractNumber  $e");
      // Ensure an exception is thrown
    }
  }
  void _createCardContract(AddCardContractEvent event, Emitter<ContractState> emit)async{
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      ApiResult apiResult = await contractRepository.createdCardContract(event.contract, event.token);
      if(apiResult.code == 0){
        emit(ContractSuccessState(apiResult.message)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("ContractBloc _getContractByContractNumber  $e");
      // Ensure an exception is thrown
    }
  }    
  void _editContract(EditContractEvent event, Emitter<ContractState> emit)async{
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      ApiResult apiResult = await contractRepository.editContract(event.request, event.token);
      if(apiResult.code == 0){
        emit(ContractSuccessState(apiResult.message)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("ContractBloc _getContractByContractNumber  $e");
      // Ensure an exception is thrown
    }
  }    

  }


