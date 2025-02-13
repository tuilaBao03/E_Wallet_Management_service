// ignore_for_file: avoid_print, file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppState.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainInitial()) {
    on<initializationEvent>(_giveCardHolderList);
    on<giveContractListEvent>(_giveContractList);
    on<giveCardListEvent>(_giveCardList);
    on<giveTransactionEvent>(_giveTransactionList);

    
  }

  void _giveCardHolderList(initializationEvent event, Emitter<MainAppState> emit) async {
    try {
      List<CardHolder> cardHolders = [];
      cardHolders = demoCardHoldersList;
      emit(giveCardHolderListState(cardHolders)); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(MainAppError('Failed to fetch user list')); // Ensure an exception is thrown
    }
  }

  void _giveContractList(giveContractListEvent event, Emitter<MainAppState> emit) async {
    try {
      List<Contract> contracts = [];
      contracts = contractlist.where((contract)=>contract.cardHolderID == event.cardHolder.cardHolderId).toList();
      emit(giveContractsListState(contracts)); // Ensure a value is returned
    } catch (e) {
      print("_giveUserList $e");
      emit(MainAppError('Failed to fetch user list')); // Ensure an exception is thrown
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
      print("_giveCardList $e");
      emit(MainAppError('Failed to fetch card list'));// Ensure an exception is thrown
    }
  }

  
  void _giveTransactionList(giveTransactionEvent event, Emitter<MainAppState> emit) async {
    try {
      List<Transaction> trans = [];
      trans = demoTransactionList.where((tran) => tran.contractID == event.contract.contractID).toList();
      emit(giveTransactionState(trans)); // Ensure a value is returned
    } catch (e) {
      print("_giveCardList $e");
      emit(MainAppError('Failed to fetch transaction list'));
       // Ensure an exception is thrown
    }
  }
} 


