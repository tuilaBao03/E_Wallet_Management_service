// ignore_for_file: unused_element
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/Contract/ContractEvent.dart';
import 'package:smartwalletapp/bloc/Contract/ContractState.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

class ContractBloc extends Bloc<ContractEvent,ContractState> {
  ContractBloc(): super(ContractInitialState()){
    on<ContractInitialEvent>(_contractInitial);

  } 
  void _contractInitial(ContractInitialEvent event, Emitter<ContractState> emit) async {
    try {
      ContractRepository contractRepository = ContractRepository();
      emit(ContractLoadingState());
      String search = event.searchText.toLowerCase().trim();
      ApiResult apiResult = await contractRepository.giveAllByCLient(event.token, event.page, search);
      if(apiResult.code == 0){

        List<GetContractResponse> contracts = apiResult.result;
        int page = apiResult.page;
        int pageAmount = apiResult.pageAmount;
        emit(ContractLoadedState(contracts,page,pageAmount)); 
      }else{
        emit(ContractErrorState(apiResult.message));
      }
      // Ensure a value is returned
    } catch (e) {
      throw Exception("_giveUserList $e");
      // Ensure an exception is thrown
    }
  }

  
  }


