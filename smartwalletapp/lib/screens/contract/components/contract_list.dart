// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/ContractBloc.dart';
import 'package:smartwalletapp/bloc/Contract/ContractEvent.dart';
import 'package:smartwalletapp/bloc/Contract/ContractState.dart';
import 'package:smartwalletapp/models/create_card_request.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/models/create_contractV2_request.dart';
import 'package:smartwalletapp/response/contract/give_contract_response.dart';
import 'package:smartwalletapp/screens/card/components/add_card.dart';
import 'package:smartwalletapp/screens/contract/components/add_contract.dart';
// Import model CardInfo
import 'package:smartwalletapp/screens/general/dialogAlert.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';
// Widget chi tiết thẻ
import '../../../constants.dart';

class ContractList extends StatefulWidget { // Danh sách thẻ truyền vào
  final String title;
  final CreateCardHolderRequest cardHolder;
  final bool isContractScreent;
  final String token;

  const ContractList({
    super.key,// Nhận danh sách thẻ
    required this.title,
    required this.cardHolder,
    required this.isContractScreent, required this.token,
  });

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _expandedContracts = {}; // Lưu trạng thái mở rộng của hợp đồng
  List<GiveContractResponse> contracts = [];
  List<CreateContractV2Request> contractV2s = [];
  List<Card> cards = [];
  final Set<String> _expandedContractV2s = {};

  @override
  void initState() {
    context.read<ContractBloc>().add(ContractInitialEvent(widget.token, widget.cardHolder));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContractBloc,ContractState>(
      builder: (context,state){
        if(state is ContractLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is ContractLoadedState){
          contracts = state.contracts;
          contractV2s = state.contractsV2s;
          cards = state.cards;
          return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).translate(widget.title),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                        icon: Icon(Icons.add, color: Colors.amber),
                        onPressed: () => _showContractAddDialog(context, widget.token),
                      ),
              ],
            ),
            const SizedBox(height: 16.0),
            _buildSearchField(),
            SizedBox(height: defaultPadding),
            contracts.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context).translate("There is no matching information"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                  )
                : _buildContractList(),
          ],
        ),
      ),
    );
  
        }
        return Center(child: CircularProgressIndicator(),);

      },
      listener: (context,state){
        if(state is ContractErrorState){
          InputDialog.show(
            context,
            title: 'Error',
            content: state.mess,
          );
        }
        else if(state is ContractSuccessState){
          InputDialog.show(
            context,
            title: 'Success',
            content: state.mess,
          );
        }
      });
    
  }

  Widget _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).translate("Finding..."),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              context.read<ContractBloc>().add(GiveContractBySearch(widget.token, widget.cardHolder, _searchController.text.trim()));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContractList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: contracts.length,
      itemBuilder: (context, index) {
        final contract = contracts[index];
        return Column(
          children: [
            ListTile(
              title: Text(contract.contractName),
              onTap: () {
                setState(() {
                  if (_expandedContracts.contains(contract.cbsNumber)) {
                    _expandedContracts.remove(contract.cbsNumber);
                  } else {
                    _expandedContracts.add(contract.cbsNumber);
                    context.read<ContractBloc>().add(GiveListContractV2Event(contract, widget.token, contracts));
                  }
                });
              },
            ),
            if (_expandedContracts.contains(contract.cbsNumber))
              Column(
                children: contractV2s
                    .where((v2) => v2.cbsNumber == contract.cbsNumber)
                    .map((v2) => _buildContractV2Tile(v2))
                    .toList(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildContractV2Tile(CreateContractV2Request contractV2) {
    return Column(
      children: [
        ListTile(
          title: Text(contractV2.contractName),
          onTap: () {
            setState(() {
              if (_expandedContractV2s.contains(contractV2.liabContractIdentifier)) {
                _expandedContractV2s.remove(contractV2.liabContractIdentifier);
              } else {
                _expandedContractV2s.add(contractV2.liabContractIdentifier);
                context.read<ContractBloc>().add(GiveListCardEvent(contractV2, widget.token, contracts, contractV2s));
              }
            });
          },
        ),
        if (_expandedContractV2s.contains(contractV2.liabContractIdentifier))
          Column(
            children: cards
                .where((card) => card.contractIdentifier == contractV2.liabContractIdentifier)
                .map((card) => ListTile(
                      title: Text(card.cardName),
                    ))
                .toList(),
          ),
      ],
    );
  }
  void _showContractDetailDialog(BuildContext context, CreateContractRequest contract) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ContractAddScreen(token: widget.token, isAdd: false, title: "Detail", object: contract,),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
    void _showContractAddDialog(BuildContext context, String token) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              width: Get.width / 2,
              child: ContractAddScreen(token: token , isAdd: true, title: "Add contract")),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(Icons.cancel, color: Colors.red),
              ),
            ],
          );
        
      },
    );
  }
  void _showCardDetailDialog(BuildContext context, CreateCardRequest card) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: AddCardScreen(cardInfo: card, isDetail: false),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
    void _showCardAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: AddCardScreen(cardInfo: selectedCardInittial, isDetail: false),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        );
      },
    );
  }
}



