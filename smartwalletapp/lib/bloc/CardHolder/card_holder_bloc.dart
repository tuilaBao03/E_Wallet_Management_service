import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_state.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:smartwalletapp/repository/cardHolderRepository.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';
import 'package:smartwalletapp/response/cardHolder/cardholderResponse.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';

class CardHolderBloc extends Bloc<CardHolderEvent,CardHolderState>{
  CardHolderBloc():super(CardHolderInitial()){
    on<CardHolderInitialEvent>(_giveCardHolderList);
    on<AddContractEvent>(_createCardHolder);
  }

  void _giveCardHolderList(CardHolderInitialEvent event, Emitter<CardHolderState> emit) async {
      try {
        CardHolderRepository repository = CardHolderRepository();
        ContractRepository contractRepository = ContractRepository();
        List<GetCardHolderResponse> cardHolders = [];
        if(event.searchText == ''){
          event.searchText = " ";
        }
        ApiResult apiResult = await repository.giveCardHolderBySearchAndPage(event.searchText, event.page, event.token);
        ApiResult contractByCardHolder = await contractRepository.giveContractByCLient(event.cardHolder.clientNumber, event.token);
        if(apiResult.code == 200 && contractByCardHolder.code == 0){
          cardHolders = apiResult.result;
          emit(CardHolderLoadedState(cardHolders, apiResult.page, apiResult.pageAmount,event.showContractList,event.cardHolder,contractByCardHolder.result));
        }
        else{
          emit(CardHolderError("${apiResult.message} ___ ${contractByCardHolder.message}"));
        } 
      } catch (e) {
        throw Exception("CardHolderBloc _ _giveCardHolderList : $e");
         // Ensure an exception is thrown
      }
  }
  // void _updatedUserInfor(UpdateUserInforEvent event, Emitter<CardHolderState> emit) async{
  //   try {
  //     User user = event.user;
  //     final UserRepository userRepository = UserRepository();
  //     user = await userRepository.updatedUser(user,event.token);
  //     emit(
  //       UpdateUserSuccessState(user)
  //     );
  //   }
  //   catch(e){
  //     print("_updatedUserInfor $e");
  //   }
  // }
  void _createCardHolder(AddContractEvent  event, Emitter<CardHolderState> emit) async{
    try{
      print("____________________________________");
      CreateCardHolderRequest cardHolder = event.cardHolder;
      CardHolderRepository cardholderRepository = CardHolderRepository();
      ApiResult apiResult = await cardholderRepository.createCardHolder(cardHolder, event.token);
      CardHolderResponse cardHolderResponse = apiResult.result;
      print("cardHolderResponse.retMsg:${cardHolderResponse.retMsg}");
      print("cardHolderResponse.resultInfo:${cardHolderResponse.resultInfo}");
      print("cardHolderResponse.retCode:${cardHolderResponse.retCode}");
      print("____________________________________");
      if(apiResult.code == 200 && cardHolderResponse.retCode == 0){
        emit(CardHolderSuccess(cardHolderResponse.resultInfo));
      }
      else{
        print("apiResult.message: ${apiResult.message}");
        emit(CardHolderSuccess(apiResult.message));
      }
      }
    catch (e){
      throw Exception("_createCardHolder: $e");
    }
  }
  


  
} 