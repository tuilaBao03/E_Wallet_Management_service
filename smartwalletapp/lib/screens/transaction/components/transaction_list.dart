// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:smartwalletapp/screens/transaction/components/transaction_detail.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> object;
  final String title;
  final HashSet<String> objectColumnName;
  final Function(Transaction) onDetailSelected;
  final Contract contract;
  final bool currentPage;

  const TransactionList({
    super.key,
    required this.object,
    required this.objectColumnName,
    required this.title,
    required this.onDetailSelected, required this.contract, required this.currentPage,
  });

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  DateTime? _startDate;
  DateTime? _endDate;
  List<Transaction> _filteredTrans = [];

  @override
  void initState() {
    super.initState();
    _filteredTrans = widget.object;
  }

    @override
  void didUpdateWidget(covariant TransactionList oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Nếu user thay đổi, cập nhật danh sách thẻ
    if (oldWidget.contract.contractName != widget.contract.contractName) {
      setState(() {
        _filteredTrans = widget.object.where((trans) => trans.contractID == widget.contract.contractName)
      .toList();
      });
    }
  }

  void _filterByDate() {
    setState(() {
      _filteredTrans = widget.object.where((tran) {
        if (_startDate == null || _endDate == null) return true;
        return tran.date.isAfter(_startDate!.subtract(Duration(days: 1))) &&
            tran.date.isBefore(_endDate!.add(Duration(days: 1)));
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
        _filterByDate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).translate(widget.title),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Nền trong suốt
                    elevation: 0, // Loại bỏ bóng
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bo góc 8px
                      side: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1), // Viền trắng
                    ),
                  ),

                    onPressed: () => _selectDate(context, true),
                    child: Text(_startDate == null
                        ? AppLocalizations.of(context).translate("startD")
                        : DateFormat('dd/MM/yyyy').format(_startDate!),style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary
                        ),
                        ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Nền trong suốt
                    elevation: 0, // Loại bỏ bóng
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bo góc 8px
                      side: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 1), // Viền trắng
                    ),
                  ),
                    onPressed: () => _selectDate(context, false),
                    child: Text(_endDate == null
                        ? AppLocalizations.of(context).translate("endD")
                        : DateFormat('dd/MM/yyyy').format(_endDate!),style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary
                        ),
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            _filteredTrans.isEmpty ?
            Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child: Text(AppLocalizations.of(context).translate("There is no matching information")),
              ),
            )
                :
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: 16.0,
                columns: widget.objectColumnName.map((name) => DataColumn(
                  label: Text(AppLocalizations.of(context).translate(name), overflow: TextOverflow.ellipsis, maxLines: 1),
                )).toList(),
                rows: List.generate(
                  _filteredTrans.length,
                  (index) => recentFileDataRow(
                    _filteredTrans[index],
                    () {
                      widget.onDetailSelected(_filteredTrans[index]);
                      print(_filteredTrans[index].toString());
                    },
                    widget.currentPage
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  DataRow recentFileDataRow(Transaction fileInfo, VoidCallback onDetail,bool currentPage) {
  return DataRow(
    cells: [
      
      DataCell(Text(fileInfo.transactionId)),
      DataCell(Text(DateFormat('dd/MM/yyyy').format(fileInfo.date))),
      if(currentPage)
        DataCell(Text(fileInfo.budget)),
      DataCell(
        IconButton(
          icon: Icon(Icons.details, color: Colors.green),
          onPressed: () => _showDetailDialog(context, fileInfo),
        ),
      ),
    ],
  );
}
void _showDetailDialog(BuildContext context, Transaction tran) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TransactionDetail(object: tran, title: "TransactionDetail"), // Thay thế bằng widget chi tiết hợp đồng của bạn
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

