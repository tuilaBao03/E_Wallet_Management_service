// ignore_for_file: avoid_print, file_names, non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppState.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/models/user.dart';
import 'package:smartwalletapp/repository/DashboardRepository.dart';
import 'package:smartwalletapp/repository/UserRepository.dart';


class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainInitial()) {
    on<initializationEvent>(_giveCardHolderList);
    on<giveContractListEvent>(_giveContractListParent);
    on<giveCardListEvent>(_giveCardList);
    on<giveTransactionEvent>(_giveTransactionList);
    on<UpdateUserInforEvent>(_updatedUserInfor);
    on<LogoutEvent>(_logout);
    on<GiveCard_TimeListEvent>(GiveCard_TimeList);

  }

  void _giveCardHolderList(initializationEvent event, Emitter<MainAppState> emit) async {
    try {
      List<CardHolder> cardHolders = [];
      cardHolders = demoCardHoldersList;
      print(cardHolders.length);
      emit(giveCardHolderListState(cardHolders)); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(MainAppErrorState('Failed to fetch user list')); // Ensure an exception is thrown
    }
  }

  void _giveContractListParent(giveContractListEvent event, Emitter<MainAppState> emit) async {
    try {
      List<Contract> contracts = [];
      contracts = contractList.where((contract)=>contract.cardHolderID == event.cardHolder.cardHolderId && contract.type=="A").toList();
      emit(giveContractsListState(contracts)); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(MainAppErrorState('Failed to fetch user list')); // Ensure an exception is thrown
    }
  }

  void _giveCardList(giveCardListEvent event, Emitter<MainAppState> emit) async {
    try {
      List<CardInfo> cards = [];
      cards = MyCards.where((card) => card.contractID == event.contract.contractID)
      .toList();
      print("mainappbloc ${cards.length}");
      emit(giveCardListState(cards)); // Ensure a value is returned
    } catch (e) {
      emit(MainAppErrorState('Failed to fetch card list'));// Ensure an exception is thrown
    }
  }
  
  void _giveTransactionList(giveTransactionEvent event, Emitter<MainAppState> emit) async {
    try {
      List<Transaction> trans = [];
      trans = demoTransactionList.where((tran) => tran.contractID == event.contract.contractID).toList();
      emit(giveTransactionState(trans)); // Ensure a value is returned
    } catch (e) {
      emit(MainAppErrorState('Failed to fetch transaction list'));
       // Ensure an exception is thrown
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

  void _logout(LogoutEvent event, Emitter<MainAppState> emit) async{
    final UserRepository userRepository = UserRepository();
    userRepository.logout();
    emit(
      LogoutSuccess()
    );
  }

  void GiveCard_TimeList(GiveCard_TimeListEvent event, Emitter<MainAppState> emit) async{
    final DashboardRepository dashboardRepository = DashboardRepository();
    print(event.end);
    print(event.start);
    List<Card_Time> list = [];
    try{
      list =  await dashboardRepository.getCardCountEachDay(event.start, event.end);
      emit(GiveCardListState(list));
    }
    catch(e){
      print("GiveCard_TimeList $e");
    }
  }



} 


