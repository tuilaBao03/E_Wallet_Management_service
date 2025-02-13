// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';


import '../../../../constants.dart';
import '../../general/text_files.dart';

class CardDetail extends StatefulWidget {
  final String title;

  final CardInfo object;

  const CardDetail({
    super.key,
    required this.object,
    required this.title,
  });

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
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
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.save),
                      onPressed: () {
                        // Add your save functionality here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Add your delete functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
            ObjectDetailInfor(objectInfo: widget.object)
          ],
        ),
      ),
    );
  }
}


class ObjectDetailInfor extends StatefulWidget {
  final CardInfo objectInfo;

  const ObjectDetailInfor({super.key, required this.objectInfo});

  @override
  State<ObjectDetailInfor> createState() => _ObjectDetailInforState();
}

class _ObjectDetailInforState extends State<ObjectDetailInfor> {
  late TextEditingController _limitController;

  final List<String> typeCardList = ["DebitCard", "CreditCard", "PrepaidCard"];

  @override
  void initState() {
    super.initState();
    _initializeControllers(widget.objectInfo);
  }

  void _initializeControllers(CardInfo objectInfo) {
    _limitController = TextEditingController(text: objectInfo.limit.toString());
  }

    @override
  void didUpdateWidget(covariant ObjectDetailInfor oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Nếu user thay đổi, cập nhật danh sách thẻ
    if (oldWidget.objectInfo.CardID != widget.objectInfo.CardID) {
      setState(() {
        _initializeControllers(widget.objectInfo);
      });
    }
  }

  @override
  void dispose() {
    _limitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: defaultPadding),
          TestFiles(editController: _limitController, title: 'limit'),
          SizedBox(height: defaultPadding),
          
          // Dropdown thay thế TextField
          Table(
            border: TableBorder.all(color: Theme.of(context).colorScheme.onPrimary),
            columnWidths: const {
              0: FlexColumnWidth(2), // Cột 1 rộng hơn
              1: FlexColumnWidth(3), // Cột 2 rộng hơn để chứa dữ liệu
            },
            children: [
              _buildTableRow('CardId', widget.objectInfo.CardID),
              _buildTableRow('Balance', widget.objectInfo.balance.toString()),
              _buildTableRow('TypeCard', widget.objectInfo.typeCard),
              _buildTableRow('bankName', widget.objectInfo.bankName.toString()),
              _buildTableRow('createdDate', widget.objectInfo.createdDate.toString()),
              _buildTableRow('updatedDate', widget.objectInfo.updateDate.toString()),
            ],
          ),

          SizedBox(height: defaultPadding),
        ],
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
