import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/apiResult.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_state.dart';
import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:smartwalletapp/repository/cardHolderRepository.dart';
import 'package:smartwalletapp/repository/contractRepository.dart';
import 'package:smartwalletapp/response/cardHolder/cardholderResponse.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';

class CardHolderBloc extends Bloc<CardHolderEvent,CardHolderState>{
  CardHolderBloc():super(CardHolderInitial()){
    on<CardHolderInitialEvent>(_giveCardHolderList);
    on<AddCardHolderEvent>(_createCardHolder);
  }

  void _giveCardHolderList(CardHolderInitialEvent event, Emitter<CardHolderState> emit) async {
      try {
        CardHolderRepository repository = CardHolderRepository();
        ContractRepository contractRepository = ContractRepository();
        List<GetCardHolderResponse> cardHolders = [];
        List<GetContractResponseCustom> contracts = [];
        if(event.searchText == ''){
          event.searchText = " ";
        }
        ApiResult apiResult = await repository.giveCardHolderBySearchAndPage(event.searchText, event.page, event.token,event.size);
        if(event.cardHolder.clientNumber != ''){
          ApiResult contractByCardHolder = await contractRepository.giveContractByClient(event.cardHolder.clientNumber, event.token);
          if(apiResult.code == 200 && contractByCardHolder.code == 0){
            cardHolders = apiResult.result;
            print(event.cardHolder.clientNumber);
            contracts = contractByCardHolder.result;
            print("number : ${contracts.length}");
            emit(CardHolderLoadedState(cardHolders, apiResult.page, apiResult.pageTotal,event.showContractList,event.cardHolder,contractByCardHolder.result,event.size));
          }
          else{
            emit(CardHolderError("${apiResult.message} ___ ${contractByCardHolder.message}"));
          } 
        }
        else{
          emit(CardHolderError("clientNumber null"));
        }
        
      } catch (e) {
        throw Exception("CardHolderBloc _ _giveCardHolderList : $e");
         // Ensure an exception is thrown
      }
  }
  void _editdUserInfor(EditCardHolderEvent event, Emitter<CardHolderState> emit) async{
    try{
      print("____________________________________");
      CardHolderRepository cardholderRepository = CardHolderRepository();
      ApiResult apiResult = await cardholderRepository.editCardHolder(event.request, event.token);
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
    catch(e){
      print("_updatedUserInfor $e");
    }
  }
  void _createCardHolder(AddCardHolderEvent  event, Emitter<CardHolderState> emit) async{
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