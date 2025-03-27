// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/bloc/Contract/contract_state.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';
import 'package:smartwalletapp/screens/contract/components/contract_list.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';
import 'package:smartwalletapp/screens/general/paginationWidget.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';
import '../../constants.dart';
import '../../models/user.dart';
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
    context.read<ContractBloc>().add(ContractInitialEvent(widget.token,1,""));
  }

  CreateContractRequest selectedContract = selectedContractInittial;
  final TextEditingController _searchController = TextEditingController();
  List<GetContractResponse> libContract = [];
  int page = 1;
  int pageAmount = 1;
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
          pageAmount = state.pageAmount;
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
                          onChanged: (value) {
                            setState(() {
                              search = _searchController.text;
                            });
                            context.read<ContractBloc>().add(ContractInitialEvent(widget.token,1,search));
                          },
                        ),
                            ContractList(
                              title: 'ContractList',
                              contracts: libContract, isContractScreent: true, token: widget.token, page: 1,
                            ),
                            PaginationWidget(page: page,amountPage: pageAmount, onPageChanged: (int page){
                              context.read<ContractBloc>().add(ContractInitialEvent(widget.token,page,search));
                            },),
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
