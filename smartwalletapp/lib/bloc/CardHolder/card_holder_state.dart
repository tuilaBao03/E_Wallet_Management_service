import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';

abstract class CardHolderState {}

class CardHolderInitial extends CardHolderState{

}

class CardHolderLoadingState extends CardHolderState{

}

class CardHolderLoadedState extends CardHolderState{
    int size;
    List<GetCardHolderResponse> cardHolders;
    int page;
    int pageTotal;
    bool showContractList;
    GetCardHolderResponse cardHolder;
    List<GetContractResponseCustom> contracts;

    CardHolderLoadedState(this.cardHolders,this.page,this.pageTotal, this.showContractList,this.cardHolder,this.contracts, this.size);
}

class CardHolderSuccess extends CardHolderState{
    String mess;
    CardHolderSuccess(this.mess);
}

class CardHolderError extends CardHolderState{
    String mess;
    CardHolderError(this.mess);
}