// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:smartwalletapp/screens/card/components/card_detail.dart';
// Import model CardInfo
import 'package:smartwalletapp/screens/contract/components/contract_detail.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_detail.dart';
// Widget chi tiết thẻ
import '../../../constants.dart';

class ContractList extends StatefulWidget {
  final List<Contract> object;
  final List<CardInfo> cards;
  final List<Transaction> trans; // Danh sách thẻ truyền vào
  final String title;
  final HashSet<String> objectColumnName;
  final Function(Contract) onContract_CardList;
  final CardHolder cardHolder;
  final bool isContractScreent;

  const ContractList({
    super.key,
    required this.object,
    required this.cards, // Nhận danh sách thẻ
    required this.objectColumnName,
    required this.title,
    required this.onContract_CardList,
    required this.cardHolder,
    required this.isContractScreent, required this.trans,
  });

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  List<Contract> _filteredContracts = [];
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _expandedContracts = {}; // Lưu trạng thái mở rộng của hợp đồng

  @override
  void initState() {
    super.initState();
    _filteredContracts = widget.object;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ContractList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cardHolder.identityCardNumber != widget.cardHolder.identityCardNumber) {
      setState(() {
        _filteredContracts = widget.object;
      });
    }
  }

  void _toggleExpand(String contractID) {
    setState(() {
      if (_expandedContracts.contains(contractID)) {
        _expandedContracts.remove(contractID);
      } else {
        _expandedContracts.add(contractID);
      }
    });
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
            Text(
              AppLocalizations.of(context).translate(widget.title),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            _buildSearchField(),
            SizedBox(height: defaultPadding),
            _filteredContracts.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context).translate("There is no matching information"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : _buildContractList(context),
          ],
        ),
      ),
    );
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
              setState(() {
                _filteredContracts = widget.object
                    .where((contract) => contract.contractID.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContractList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _filteredContracts.length,
      itemBuilder: (context, index) {
        Contract contract = _filteredContracts[index];
        bool hasChildren = contract.children.isNotEmpty;

        return Column(
          children: [
            InkWell(
              onTap: () => _toggleExpand(contract.contractID), // Nhấn vào hợp đồng để mở rộng
              child: Container(
                margin: EdgeInsets.symmetric(vertical: Get.height/100),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(contract.note),
                  subtitle: Text(contract.createdDate.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.details, color: Colors.green),
                        onPressed: () => _showContractDetailDialog(context, contract),
                      ),
                      if (hasChildren)
                        IconButton(
                          icon: Icon(
                            _expandedContracts.contains(contract.contractID) ? Icons.expand_less : Icons.expand_more,
                            color: Colors.orange,
                          ),
                          onPressed: () => _toggleExpand(contract.contractID),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (_expandedContracts.contains(contract.contractID))
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: contract.children.map((child) => _buildChildContractTile(child, context)).toList(),
                ),
              ),
          ],
        );
      },
    );
  }

// Widget hợp đồng con
  Widget _buildChildContractTile(Contract child, BuildContext context) {
    List<CardInfo> contractCards = widget.cards.where((card) => card.contractID == child.contractID).toList();
    List<Transaction> contractTran = widget.trans.where((card) => card.contractID == child.contractID).toList();
    bool hasCards = contractCards.isNotEmpty;

    return Column(
      children: [
        InkWell(
          onTap: () => _toggleExpand(child.contractID), // Nhấn hợp đồng con để mở rộng danh sách card
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height/100),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(child.note),
              subtitle: Text(child.createdDate.toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.details, color: Colors.green),
                    onPressed: () => _showContractDetailDialog(context, child),
                  ),
                  if (hasCards)
                    IconButton(
                      icon: Icon(
                        _expandedContracts.contains(child.contractID) ? Icons.expand_less : Icons.expand_more,
                        color: Colors.orange,
                      ),
                      onPressed: () => _toggleExpand(child.contractID),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (_expandedContracts.contains(child.contractID))
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: !widget.isContractScreent? Column(
              children: contractCards.map((card) => _buildCardTile(card, context)).toList(),
            ) 
            : 
            Column(
              children: contractTran.map((tran) => _buildTransactionTile(tran, context)).toList(),
            ) ,
          ),
      ],
    );
  }

// Widget thẻ (Card)
  Widget _buildCardTile(CardInfo card, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height/100),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text("ID: ${card.CardID}"),
        subtitle: Text("Type: ${card.typeCard}"),
        trailing: IconButton(
          icon: Icon(Icons.details, color: Colors.green),
          onPressed: () => _showCardDetailDialog(context, card),
        ),
      ),
    );
  }

  // Widget thẻ (Card)
  Widget _buildTransactionTile(Transaction tran, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height/100),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text("ID: ${tran.transactionId}"),
        subtitle: Text("Amount: ${tran.budget.toString()}"),
        trailing: IconButton(
          icon: Icon(Icons.details, color: Colors.green),
          onPressed: () => _showTransactionDetailDialog(context, tran),
        ),
      ),
    );
  }

  void _showContractDetailDialog(BuildContext context, Contract contract) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ContractDetail(object: contract, title: "ContractDetail"),
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
  void _showCardDetailDialog(BuildContext context, CardInfo card) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: CardDetail(object: card, title: "CardDetail"),
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
  void _showTransactionDetailDialog(BuildContext context, Transaction tran) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TransactionDetail(object: tran, title: "DetailTransaction"),
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
