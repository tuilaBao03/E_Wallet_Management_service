// ignore_for_file: file_names, library_private_types_in_public_api, prefer_final_fields, avoid_print, unused_field

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/user.dart';
import '../../../../constants.dart';


class CardList extends StatefulWidget {
  final List<CardInfo> object;
  final String title;
  final HashSet<String> objectColumnName;
  final Function(CardInfo) onDetailSelected;
  final User user;

  const CardList({
    super.key, 
    required this.object, 
    required this.objectColumnName,
    required this.title,
    required this.onDetailSelected, required this.user,
  });

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  TextEditingController _searchController = TextEditingController();
  List<CardInfo> _filteredCardInfos = [];
  late User _user;

  @override
  void initState() {
  super.initState();
  _user = widget.user;
  _filteredCardInfos = widget.object
      .where((card) => card.userId == widget.user.userId)
      .toList();
  print(_filteredCardInfos.length);
}

  void _searchCardInfo() {
    setState(() {
      _filteredCardInfos = widget.object.where((card) =>
        card.bankName.toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
    });
  }

  @override
  void didUpdateWidget(covariant CardList oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Nếu user thay đổi, cập nhật danh sách thẻ
    if (oldWidget.user.userId != widget.user.userId) {
      setState(() {
        _user = widget.user;
        _filteredCardInfos = widget.object
            .where((card) => card.userId == widget.user.userId)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      padding: EdgeInsets.all(defaultPadding),
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
                    onChanged: (value) => _searchCardInfo(),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.blue),
                  onPressed: _searchCardInfo,
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                columns: widget.objectColumnName.map((name) => DataColumn(
                  label: Text(AppLocalizations.of(context).translate(name), overflow: TextOverflow.ellipsis, maxLines: 1),
                )).toList(),
                rows: List.generate(
                  _filteredCardInfos.length,
                  (index) => recentFileDataRow(
                    _filteredCardInfos[index],
                    () {
                      widget.onDetailSelected(_filteredCardInfos[index]);
                      print(_filteredCardInfos[index].toString());
                    }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(CardInfo fileInfo, VoidCallback onDetail) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.CardID)),
      DataCell(
        Row(
          children: [
        
            IconButton(
              icon: Icon(Icons.details, color: Colors.green),
              onPressed: onDetail,
            )
          ],
        ),
      ),
    ],
  );
}
