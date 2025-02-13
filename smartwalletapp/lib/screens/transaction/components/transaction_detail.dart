// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/transaction.dart';
import '../../../../constants.dart';


class TransactionDetail extends StatefulWidget {
  final String title;
  final Transaction object;


  const TransactionDetail({
    super.key,
    required this.object,
    required this.title, 
  });

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width/1.2,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate(widget.title),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ObjectDetailInfor(transaction: widget.object)
          ],
        ),
      ),
    );
  }
}


class ObjectDetailInfor extends StatefulWidget {
  final Transaction transaction; // Chỉ nhận 1 transaction

  const ObjectDetailInfor({super.key, required this.transaction});

  @override
  State<ObjectDetailInfor> createState() => _ObjectDetailInforState();
}



class _ObjectDetailInforState extends State<ObjectDetailInfor> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(color: Theme.of(context).colorScheme.onPrimary),
          columnWidths: const {
            0: FlexColumnWidth(2), // Cột 1 rộng hơn
            1: FlexColumnWidth(3), // Cột 2 rộng hơn để chứa dữ liệu
          },
          children: [
            _buildTableRow('TransactionID', widget.transaction.transactionId.toString()),
            _buildTableRow('budget', widget.transaction.budget.toString()),
            _buildTableRow('typeMoney', widget.transaction.typeMoney),
            _buildTableRow('bankName', widget.transaction.bankName.toString()),
            _buildTableRow('typeTran', 
                widget.transaction.typeTransaction ==0 ? "Deposit" :
                widget.transaction.typeTransaction == 1 
                ?"Cash out":"Transfer"),
            _buildTableRow('note', widget.transaction.note.toString()),
            _buildTableRow('CardId', widget.transaction.contractID.toString()),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String field, String value) {
    return TableRow(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context).translate(field)
            , style: TextStyle( color: Theme.of(context).colorScheme.onPrimary)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value,style: TextStyle( color: Theme.of(context).colorScheme.onPrimary)),
        ),
      ],
    );
  }
}


