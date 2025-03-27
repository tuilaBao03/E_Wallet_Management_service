// ignore_for_file: file_names, library_private_types_in_public_api, prefer_final_fields, avoid_print, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/models/create_cardholder_request.dart';
import 'package:smartwalletapp/response/cardHolder/getCardHolderResponse.dart';
import 'package:smartwalletapp/screens/customer/components/add_customer.dart';
import 'package:smartwalletapp/screens/customer/components/detail_customer.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';
import '../../../constants.dart';

class CustomerList extends StatefulWidget {
  final String token;
  final List<GetCardHolderResponse> cardholders;
  final String title;
  final bool showContractList;
  final int page;
  final String search;

  const CustomerList({
    super.key,
    required this.cardholders,
    required this.title,
    required this.token, required this.showContractList, required this.page, required this.search,
  });

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {

  final TextEditingController _searchController = TextEditingController();
  final HashSet<String> objectColumnNameOfUser = HashSet.from([
    "FirstName",
    "LastName",
    "ClientNumber",
    "SocialNumber",
    "Action"
  ]);
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchUser() {
    context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token,_searchController.text.trim(),widget.page,widget.showContractList,widget.cardholders[0]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      padding: EdgeInsets.all(defaultPadding),
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
              icon: Icon(Icons.add),
              onPressed: () {
                _showAddDialog(context, emptyCardHolder_ADD);
              },
            ),
            ],
            ),
            
            SizedBox(height: defaultPadding),
            Row(
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
                    onSubmitted: (_) => _searchUser(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.blue),
                  onPressed: _searchUser,
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            widget.cardholders.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context).translate("There is no matching information"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      columns: objectColumnNameOfUser
                          .map(
                            (name) => DataColumn(
                              label: Text(
                                AppLocalizations.of(context).translate(name),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          )
                          .toList(),
                      rows: widget.cardholders.map((cardHolder) {
                        return _buildDataRow(cardHolder, context);
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(GetCardHolderResponse cardHolder, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Text(cardHolder.firstName)),
        DataCell(Text(cardHolder.lastName)),
        DataCell(Text(cardHolder.clientNumber)),
        DataCell(Text(cardHolder.socialNumber)),
        DataCell(
          Row(children: [
            IconButton(
            icon: const Icon(Icons.details, color: Colors.green),
            onPressed: () => _showDetailDialog(context, cardHolder),
          ),
          SizedBox(width: 10,),
          IconButton(
            icon: const Icon(Icons.content_paste_search_outlined, color: Colors.blueAccent),
            onPressed: (){
              context.read<CardHolderBloc>().add(CardHolderInitialEvent(widget.token, widget.search, widget.page, widget.showContractList == true ? false : true,cardHolder ));
            },
          ),
          SizedBox(width: 10,),
          IconButton(
            icon: const Icon(Icons.add_card, color: Colors.blueAccent),
            onPressed: (){
              
            },
          ),
          ],)
          
        ),
        
      ],
    );
  }

  void _showDetailDialog(BuildContext context, GetCardHolderResponse cardHolder) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: Get.width / 2,
            child: DetailCustomer(object: cardHolder,title: "Card Holder Detail",)
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel, color: Colors.red,),
            ),
          ],
        );
      },
    );
  }
  void _showAddDialog(BuildContext context, CreateCardHolderRequest cardHolder) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: Get.width / 2,
            child: AddCustomer(
              object: cardHolder,
              title: 'CustomerAdd',
              isDetail: false,
              isAdd: true, token: widget.token,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel, color: Colors.red,),
            ),
          ],
        );
      },
    );
  }
}
