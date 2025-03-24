import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';

abstract class CardHolderState {}

class CardHolderInitial extends CardHolderState{

}

class CardHolderLoadingState extends CardHolderState{

}

class CardHolderLoadedState extends CardHolderState{
    List<GetCardHolderResponse> cardHolders;
    int page;
    int pageAmount;
    bool showContractList;
    GetCardHolderResponse cardHolder;
    List<GetContractResponse> contracts;

    CardHolderLoadedState(this.cardHolders,this.page,this.pageAmount, this.showContractList,this.cardHolder,this.contracts);
}

class CardHolderSuccess extends CardHolderState{
    String mess;
    CardHolderSuccess(this.mess);
}

class CardHolderError extends CardHolderState{
    String mess;
    CardHolderError(this.mess);
}