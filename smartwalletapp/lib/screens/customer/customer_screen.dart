
// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_state.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';
import 'package:smartwalletapp/screens/customer/components/contract_list_customer.dart';
import 'package:smartwalletapp/screens/customer/components/customer_list.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';
import 'package:smartwalletapp/screens/general/page.dart';
import 'package:smartwalletapp/screens/general/size.dart';

import '../../constants.dart';
import '../../request/user.dart';
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
  
  final TextEditingController _searchController = TextEditingController();
  bool showContractList = false;
  List<GetCardHolderResponse> cardHolders = [];
  String searchText = '';
  List<GetContractResponseCustom> contracts = [];


  int page = 1;
  String clientIdentifier = '';
  int pageTotal = 1;
  int size = 10;
  @override
  void initState() {

    super.initState();
    context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,searchText,1,showContractList,selectedcardHolder,size));
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
        pageTotal = state.pageTotal;
        showContractList = state.showContractList;
        contracts = state.contracts;
        size = state.size;

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
                            TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      hintText: AppLocalizations.of(context).translate("Finding by name"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onSubmitted: (_) => {
                                      context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,_searchController.text.trim(),1,showContractList,selectedcardHolder,size))
                                    },
                                  ),

                            SizedBox(height: 10,),
                                
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
                                        CustomerList(cardholders: cardHolders, title: "CashHolderList", token: widget.token, showContractList: showContractList, page: page, search: searchText, size: size,)
                                          ),
                                      if(Responsive.isDesktop(context) && showContractList)
                                        SizedBox(width: defaultPadding),
                                      if(Responsive.isDesktop(context) && showContractList)
                                      Expanded(
                                        flex: 1,
                                        child: 
                                        ContractListByCustomer(
                                          token: widget.token, clientIdentifier: selectedcardHolder.clientNumber, onpress: () {
                                            context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,searchText,1,false,selectedcardHolder,size));
                                            },))
                                    ],
                                  ),
                                SizedBox(height: defaultPadding),
                                if(!Responsive.isDesktop(context) && showContractList)
                                  ContractListByCustomer(
                                          token: widget.token, clientIdentifier: selectedcardHolder.clientNumber, onpress: () { 
                                            setState(() {
                                              context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,searchText,1,false,selectedcardHolder,size));
                                            });
                                           },)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PageInfoWidget(
                        page: page,
                        pageAmount: pageTotal,
                        onUpPress: () {
                          if (page < pageTotal) {
                            context.read<CardHolderBloc>().add(
                              CardHolderInitialEvent(
                                widget.token, searchText, page + 1, showContractList, selectedcardHolder,size
                              )
                            );
                          }
                        },
                        onDownPress: () {
                          if (page > 1) {
                            context.read<CardHolderBloc>().add(
                              CardHolderInitialEvent(
                                widget.token, searchText, page - 1, showContractList, selectedcardHolder,size
                              )
                            );
                          }
                        },
                      ),
                      SizeDropdown(
                            onSizeSelected: (int? selectedValue) {
                              setState(() {
                                context.read<CardHolderBloc>().add(
                              CardHolderInitialEvent(
                                widget.token, searchText, page, showContractList, selectedcardHolder,selectedValue ??10
                              )
                            );
                                
                              });
                            },
                          ),
                    ],
                  )
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
            onPressHidden1: () {
              context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,searchText,page,showContractList,selectedcardHolder,size));
            },
          );
      }

    }
    );
    
    }
}

