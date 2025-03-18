// ignore_for_file: avoid_print, file_names, non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppState.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/user.dart';
import 'package:smartwalletapp/repository/cardHolderRepository.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';
import 'package:smartwalletapp/repository/userRepository.dart';
import 'package:smartwalletapp/repository/authRepository.dart';
import 'package:smartwalletapp/response/cardHolder/cardholderResponse.dart';
import 'package:smartwalletapp/response/contract/contractResponse.dart';


class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainInitial()) {
    on<initializationEvent>(_giveCardHolderList);
    on<UpdateUserInforEvent>(_updatedUserInfor);
    on<LogoutEvent>(_logout);
    // on<GiveCard_TimeListEvent>(giveCard_TimeList);
    on<AddCardHolderEvent>(_createCardHolder);
    on<AddContractEvent>(_createContract);

  }

  void _giveCardHolderList(initializationEvent event, Emitter<MainAppState> emit) async {
    try {
      List<CardHolder> cardHolders = [];
      cardHolders = demoCardHoldersList;
      print(cardHolders.length);
      emit(giveCardHolderListState(cardHolders,1,1)); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(MainAppErrorState('Failed to fetch user list')); // Ensure an exception is thrown
    }
  }

  void _updatedUserInfor(UpdateUserInforEvent event, Emitter<MainAppState> emit) async{
    try {
      User user = event.user;
      final UserRepository userRepository = UserRepository();
      user = await userRepository.updatedUser(user,event.token);
      emit(
        UpdateUserSuccessState(user)
      );
    }
    catch(e){
      print("_updatedUserInfor $e");
    }
  }

  void _createCardHolder(AddCardHolderEvent event, Emitter<MainAppState> emit) async{
    try{
      print("____________________________________");
      CardHolder cardHolder = event.cardHolder;
      CardholderRepository cardholderRepository = CardholderRepository();
      ApiResult apiResult = await cardholderRepository.createCardHolder(cardHolder, event.token);
      CardHolderResponse cardHolderResponse = apiResult.result;
      print("cardHolderResponse.retMsg:${cardHolderResponse.retMsg}");
      print("cardHolderResponse.resultInfo:${cardHolderResponse.resultInfo}");
      print("cardHolderResponse.retCode:${cardHolderResponse.retCode}");
      print("____________________________________");
      if(apiResult.code == 200 && cardHolderResponse.retCode == 0){
        emit(CreateCardHolderSuccessState(cardHolderResponse.resultInfo));
      }
      else{
        print("apiResult.message: ${apiResult.message}");
        emit(MainAppErrorState(apiResult.message));
      }
      }
    catch (e){
      throw Exception("_createCardHolder: $e");
    }
  }
  void _createContract(AddContractEvent event, Emitter<MainAppState> emit) async{
    Contract contract = event.contract;
    ContractRepository contractRepository = ContractRepository();

    ApiResult apiResult = await contractRepository.cretateContract(contract, event.token);
    String mess = apiResult.message;

    if(apiResult.code == 0){
      print("_________success_________");
      CreateContractResponse contractResponse = apiResult.result;
      emit(SuccessState(contractResponse.retMsg));
    }
    else{
      print("_________false_________");
      emit(MainAppErrorState(mess));
    }
  }
  void _logout(LogoutEvent event, Emitter<MainAppState> emit) async{
    final AuthenRepository authRepository = AuthenRepository();
    authRepository.logout();
    emit(
      LogoutSuccess()
    );
  }
  // void giveCard_TimeList(GiveCard_TimeListEvent event, Emitter<MainAppState> emit) async{
  //   final DashboardRepository dashboardRepository = DashboardRepository();
  //   List<Card_Time> list = [];
  //   try{
  //     list =  await dashboardRepository.getCardCountEachDay(event.start, event.end);
  //     emit(GiveCardListState(list));
  //   }
  //   catch(e){
  //     print("GiveCard_TimeList $e");
  //   }
  }
  // void LockOrUnLockCard(LockOrUnLockCardEvent event, Emitter<MainAppState> emit) async{
  //   final CardRepository cardRepository = CardRepository();
  //   try{
  //       ApiResult apiResult = await cardRepository.lockOrUnLockCard(event.newStatus, event.card, event.token);
  //       int code = apiResult.code;
  //       String message = apiResult.message;
  //       if(code == 200){
  //         Cards cardInfo = apiResult.result;
  //         emit(UpdateStatusCardSuccessState(cardInfo.status));
  //       }
  //       else {
  //         emit(MainAppErrorState(message));
  //       }
  //   }
  //   catch(e){
  //     throw Exception("_LockOrUnLockCard $e");

  //   }
  // }
  // void LockOrUnLockContract(LockOrUnLockContractEvent event, Emitter<MainAppState> emit) async{
  //   final ContractRepository contractRepository = ContractRepository();
  //   try{
  //       ApiResult apiResult = await contractRepository.lockOrUnLockContract(event.newStatus, event.contract, event.token);
  //       int code = apiResult.code;
  //       String message = apiResult.message;
  //       if(code == 200){
  //         CardInfo cardInfo = apiResult.result;
  //         emit(UpdateStatusContractSuccessState(cardInfo.status));
  //       }
  //       else {
  //         emit(MainAppErrorState(message));
  //       }
  //   }
  //   catch(e){
  //     throw Exception("_LockOrUnLockContract $e");

  //   }
  // }





