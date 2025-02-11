// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';

import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';


import '../../../../constants.dart';
import '../../general/text_files.dart';

class CardDetail extends StatefulWidget {
  final bool isActive;
  final bool isUpdate;
  final String title;
  final bool isImage;
  final CardInfo object;

  const CardDetail({
    super.key,
    required this.object,
    required this.isImage,
    required this.title,
    required this.isActive,
    required this.isUpdate,
  });

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
  late TextEditingController _bankNameController;
  late TextEditingController _balanceController;
  late String _selectedTypeCard;

  final List<String> typeCardList = ["DebitCard", "CreditCard", "PrepaidCard"];

  @override
  void initState() {
    super.initState();
    _initializeControllers(widget.objectInfo);
  }

  void _initializeControllers(CardInfo objectInfo) {
    _bankNameController = TextEditingController(text: objectInfo.bankName);
    _balanceController = TextEditingController(text: objectInfo.balance.toString());
    _selectedTypeCard = objectInfo.typeCard;
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
    _bankNameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: defaultPadding),
          TestFiles(editController: _bankNameController, title: 'Bank Name'),
          SizedBox(height: defaultPadding),
          TestFiles(editController: _balanceController, title: 'Balance'),
          SizedBox(height: defaultPadding),
          
          // Dropdown thay thế TextField
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: DropdownButtonFormField<String>(
              value: _selectedTypeCard,
              decoration: InputDecoration(
                labelText: 'Type Card',
                border: OutlineInputBorder(),
              ),
              items: typeCardList.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTypeCard = newValue!;
                });
              },
            ),
          ),

          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
