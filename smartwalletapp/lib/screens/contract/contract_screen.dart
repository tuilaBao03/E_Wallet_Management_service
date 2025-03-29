// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/bloc/Contract/contract_state.dart';
import 'package:smartwalletapp/request/create_contract_liab_request.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';
import 'package:smartwalletapp/screens/contract/components/contract_list.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';
import 'package:smartwalletapp/screens/general/page.dart';
import 'package:smartwalletapp/screens/general/size.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';
import '../../constants.dart';
import '../../request/user.dart';
import '../general/header.dart';

class ContractScreen extends StatefulWidget {
  final bool isAuth;
  final String token;
  final User user;
  final Function(Locale) onLanguageChange;
  const ContractScreen({super.key,
    required this.isAuth, required this.user, required this.onLanguageChange, required this.token,
  });

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ContractBloc>().add(ContractInitialEvent(widget.token,1,"",10));
  }

  CreateContractLiabRequest selectedContract = selectedContractInittial;
  final TextEditingController _searchController = TextEditingController();
  List<GetContractResponseCustom> libContract = [];
  int page = 1;
  int pageTotal = 1;
  String search = "";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContractBloc,ContractState>(
      builder: (context,state){
        if(state is ContractLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is ContractLoadedState){
          libContract = state.libContracts;
          page = state.page;
          pageTotal = state.pageAmount;
          int size = state.size;
          return SafeArea(
            child: SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Header(title: "Contract",user: widget.user, isAuth: widget.isAuth, onLanguageChange: widget.onLanguageChange,),
                  SizedBox(height: defaultPadding),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                          TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).translate("Finding by ContractName"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              search = _searchController.text;
                            });
                            context.read<ContractBloc>().add(ContractInitialEvent(widget.token,1,search,size));
                          },
                        ),

                        SizedBox(height: 10,),
                            ContractList(
                              title: 'ContractList',
                              contracts: libContract, isContractScreent: true, token: widget.token, page: 1,
                            ),
                        SizedBox(height: 10,),
                      


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PageInfoWidget(
                            page: page,
                            pageAmount: pageTotal,
                            onUpPress: () {
                              if (page < pageTotal) {
                                context.read<ContractBloc>().add(ContractInitialEvent(widget.token,page,search,size));
                              }
                            },
                            onDownPress: () {
                              if (page > 1) {
                                context.read<ContractBloc>().add(ContractInitialEvent(widget.token,page,search,size));
                              }
                            },
                          ),
                          SizeDropdown(
                            onSizeSelected: (int? selectedValue) {
                                  setState(() {
                                    context.read<ContractBloc>().add(ContractInitialEvent(widget.token,page,search,selectedValue??10));
                                  });
                                },
                              ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
              
            ),

            
          );
        
        }
        return Center(child: CircularProgressIndicator(),);

      },
      listener: (context,state){
        if(state is ContractErrorState){
          InputDialog.showError(
            context,
            title: 'Error',
            content: state.mess,
          );
        }
        else if(state is ContractSuccessState){
          InputDialog.showSuccess(
            context,
            title: 'Success',
            content: state.mess,
          );
        }
      });
    
    
    }
}
