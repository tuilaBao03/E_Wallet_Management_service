// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/ContractBloc.dart';
import 'package:smartwalletapp/bloc/Contract/ContractEvent.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/response/contract/get_contract_response.dart';
import 'package:smartwalletapp/screens/card/components/add_card.dart';
import 'package:smartwalletapp/screens/contract/components/add_contract.dart';
import 'package:smartwalletapp/screens/contract/components/detail_contract.dart';
// Import model CardInfo
import 'package:smartwalletapp/screens/main/components/classInitial.dart';
// Widget chi tiết thẻ
import '../../../constants.dart';

class ContractList extends StatefulWidget { // Danh sách thẻ truyền vào
  final String title;
  final List<GetContractResponse> contracts;
  final bool isContractScreent;
  final String token;
  final int page;
  

  const ContractList({
    super.key,// Nhận danh sách thẻ
    required this.title,
    required this.contracts,
    required this.isContractScreent, required this.token, required this.page,
  });

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  final TextEditingController _searchController = TextEditingController();
  List<GetContractResponse> libContract = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: defaultPadding),
            libContract.isEmpty
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
Widget _buildContractList() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: libContract.length,
    itemBuilder: (context, index) {
      final contract = libContract[index];
      return _buildContractTile(contract);
    },
  );
}

Widget _buildContractTile(GetContractResponse contract) {
  return ExpansionTile(
    title: Row(
      children: [
        Text(contract.contractName ?? "Unknown"),
        IconButton(onPressed: (){
          _showContractDetailDialog(context,contract);

        }, icon: Icon(Icons.details,color: Colors.green,)),
        IconButton(onPressed: (){
        }, icon: Icon(Icons.edit,color: Colors.blue)),
        IconButton(onPressed: (){
          
        }, icon: Icon(Icons.add,color: Colors.amber,)),
      ],
    ),
    children: contract.contracts.isNotEmpty
        ? contract.contracts.map((subContract) => _buildContractTile(subContract)).toList()
        : [],
  );
}


  
  void _showContractDetailDialog(BuildContext context, GetContractResponse contract) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ContractDetailScreen(contractInfo: contract),
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
              child: ContractFormScreen(token: token,title: "Add contract")),
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



