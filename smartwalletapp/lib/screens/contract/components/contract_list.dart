// ignore_for_file: library_private_types_in_public_api, avoid_print, non_constant_identifier_names

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/cardholder.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/screens/contract/components/contract_detail.dart';
import '../../../constants.dart';

class ContractList extends StatefulWidget {
  final List<Contract> object;
  final String title;
  final HashSet<String> objectColumnName;
  final Function(Contract) onContract_CardList;
  final Function(Contract) onContract_TranSaction;
  final CardHolder cardHolder;

  const ContractList({
    super.key,
    required this.object,
    required this.objectColumnName,
    required this.title,
    required this.onContract_CardList,
    required this.onContract_TranSaction, required this.cardHolder,
  });

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  DateTime? _startDate;
  DateTime? _endDate;
  List<Contract> _filteredContracts = [];
  final TextEditingController _searchController = TextEditingController();

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

    // Nếu user thay đổi, cập nhật danh sách thẻ
    if (oldWidget.cardHolder.cardHolderId != widget.cardHolder.cardHolderId) {
      setState(() {
        _filteredContracts = widget.object;
      });
    }
  }

  void _filterByValue() {
    String query = _searchController.text.trim().toLowerCase();

    setState(() {
      _filteredContracts = widget.object.where((contract) {
        bool matchesDate = true;
        bool matchesQuery = contract.contractID.toLowerCase().contains(query);

        if (_startDate != null && _endDate != null) {
          matchesDate = contract.createdDate.isAfter(_startDate!.subtract(const Duration(days: 1))) &&
                        contract.createdDate.isBefore(_endDate!.add(const Duration(days: 1)));
        }

        return matchesQuery && matchesDate;
      }).toList();
    });
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
        _filterByValue();
      });
    }
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
            _buildDatePickers(context),
            SizedBox(height: defaultPadding),
            _buildSearchField(),
            SizedBox(height: defaultPadding),
            _filteredContracts.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context).translate("There is no matching information"),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : _buildDataTable(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePickers(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDateButton(
            context,
            label: _startDate == null
                ? AppLocalizations.of(context).translate("startD")
                : DateFormat('dd/MM/yyyy').format(_startDate!),
            onTap: () => _selectDate(context, true),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildDateButton(
            context,
            label: _endDate == null
                ? AppLocalizations.of(context).translate("endD")
                : DateFormat('dd/MM/yyyy').format(_endDate!),
            onTap: () => _selectDate(context, false),
          ),
        ),
      ],
    );
  }

  Widget _buildDateButton(BuildContext context, {required String label, required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
            onChanged: (_) => _filterByValue(),
            onSubmitted: (_) => _filterByValue(),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.blue),
          onPressed: _filterByValue,
        ),
      ],
    );
  }

  Widget _buildDataTable(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columnSpacing: 16.0,
        columns: widget.objectColumnName
            .map((name) => DataColumn(
                  label: Text(AppLocalizations.of(context).translate(name), overflow: TextOverflow.ellipsis, maxLines: 1),
                ))
            .toList(),
        rows: _filteredContracts.map((contract) {
          return _buildDataRow(contract, context);
        }).toList(),
      ),
    );
  }

  DataRow _buildDataRow(Contract contract, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Text(contract.contractID)),
        DataCell(Text(DateFormat('dd/MM/yyyy').format(contract.createdDate))),
        DataCell(
          IconButton(
            icon: const Icon(Icons.details, color: Colors.green),
            onPressed: () => _showDetailDialog(context, contract),
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.content_paste_search_outlined, color: Colors.blueAccent),
            onPressed: () => widget.onContract_CardList(contract),
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.content_paste_search_outlined, color: Colors.blueAccent),
            onPressed: () => widget.onContract_TranSaction(contract),
          ),
        ),
      ],
    );
  }

  void _showDetailDialog(BuildContext context, Contract contract) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ContractDetail(object: contract, title: "ContractDetail"), // Thay thế bằng widget chi tiết hợp đồng của bạn
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:Icon(Icons.cancel, color: Colors.red,),
            ),
          ],
        );
      },
    );
  }
}
