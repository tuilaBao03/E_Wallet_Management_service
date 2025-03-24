
// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_state.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';
import 'package:smartwalletapp/screens/contract/components/contract_list.dart';
import 'package:smartwalletapp/screens/customer/components/customer_list.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';

import '../../constants.dart';
import '../../models/user.dart';
import '../../responsive.dart';
import '../general/header.dart';


class CustomerScreen extends StatefulWidget {

  final String token;
  final User user;
  final bool isAuth; 
  final Function(Locale) onLanguageChange;
  const CustomerScreen({
    super.key, 
    required this.user,   
    required this.onLanguageChange, required this.token, required this.isAuth});
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  GetCardHolderResponse selectedcardHolder = emptyCardHolder_ReS;
  bool showContractList = false;
  List<GetCardHolderResponse> cardHolders = [];
  String searchText = '';
  List<GetContractResponse> contracts = [];

  int page = 1;
  int pageAmount = 1;
  @override
  void initState() {

    super.initState();
    context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,searchText,page,showContractList,selectedcardHolder));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardHolderBloc,CardHolderState>
    (builder: (context,state){
      if(state is CardHolderLoadingState){
        return Center(child: CircularProgressIndicator(),);
      }
      if(state is CardHolderLoadedState){
        cardHolders = state.cardHolders;
        selectedcardHolder = state.cardHolder;
        page = state.page;
        pageAmount = state.pageAmount;
        showContractList = state.showContractList;
        contracts = state.contracts;

        return SafeArea(
            child: SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Header(title: AppLocalizations.of(context).translate("Customer"),
                  user: widget.user,
                  isAuth: widget.isAuth, onLanguageChange: widget.onLanguageChange),
                  SizedBox(height: defaultPadding),
                  Column(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: 
                                        CustomerList(cardholders: cardHolders, title: "CashHolderDetail", token: widget.token, showContractList: showContractList, page: page, search: searchText)
                                          ),
                                      if(Responsive.isDesktop(context) && showContractList)
                                        SizedBox(width: defaultPadding),
                                      if(Responsive.isDesktop(context) && showContractList)
                                      Expanded(
                                        flex: 1,
                                        child: 
                                        ContractList(
                                          title: "Contract",
                                          isContractScreent: false, token: widget.token, page: 1, contracts: contracts,),)
                                    ],
                                  ),
                                SizedBox(height: defaultPadding),
                                if(!Responsive.isDesktop(context) && showContractList)
                                  ContractList(
                                          title: "Contract",
                                           isContractScreent: false, token: widget.token, page: 1, contracts: contracts,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]
              ),
            ) 
          );
  

      }
      return Center(child: CircularProgressIndicator(),);

    }, listener: (context,state){
      if(state is CardHolderSuccess){
        InputDialog.showSuccess(
            context,
            title: 'Thông báo thành công',
            content: state.mess,
          );
      }
      else if(state is CardHolderError){
        InputDialog.showError(
            context,
            title: 'Thông báo that bai ',
            content: state.mess,
          );
      }

    }
    );
    
    }
}

