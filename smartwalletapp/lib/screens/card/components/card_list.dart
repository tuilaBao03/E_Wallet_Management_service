// ignore_for_file: file_names, library_private_types_in_public_api, prefer_final_fields, avoid_print, unused_field

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import thư viện format ngày
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/models/contract.dart';
import 'package:smartwalletapp/screens/card/components/card_detail.dart';
import '../../../../constants.dart';

class CardList extends StatefulWidget {
  final List<CardInfo> object;
  final String title;
  final HashSet<String> objectColumnName;
  final Contract contract;

  const CardList({
    super.key,
    required this.object,
    required this.objectColumnName,
    required this.title,
    required this.contract,
  });

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  TextEditingController _searchController = TextEditingController();
  List<CardInfo> _filteredCardInfos = [];
  late Contract _contract;
  DateTime? _selectedDate; // Biến lưu ngày tháng được chọn

  @override
  void initState() {
    super.initState();
    _contract = widget.contract;
    _filteredCardInfos = widget.object;
  }

      @override
  void didUpdateWidget(covariant CardList oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Nếu user thay đổi, cập nhật danh sách thẻ
    if (oldWidget.contract.clientIdentifier != widget.contract.clientIdentifier) {
      setState(() {
        _filteredCardInfos = widget.object.where((trans) => trans.contractID == widget.contract.contractName)
      .toList();
      });
    }
  }

  void _searchCardInfo() {
    setState(() {
      _filteredCardInfos = widget.object.where((card) {
        bool matchesSearch = card.CardID.toLowerCase().contains(_searchController.text.toLowerCase());
        bool matchesDate = _selectedDate == null ||
            DateFormat('yyyy-MM-dd').format(card.createdDate) == DateFormat('yyyy-MM-dd').format(_selectedDate!);

        return matchesSearch && matchesDate;
      }).toList();
    });
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
      _searchCardInfo();
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
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary
              )
              
              
            ),
            SizedBox(height: defaultPadding),

            // Thanh tìm kiếm + Lọc theo ngày
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
                SizedBox(width: 8),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary, // Đổi màu chữ toàn bộ nút
                      backgroundColor: Theme.of(context).colorScheme.primary, // Màu nền
                    ),
                    onPressed: _pickDate,
                    icon: Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.onPrimary),
                    label: Text(
                      _selectedDate == null
                          ? AppLocalizations.of(context).translate("Pick Date")
                          : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                    ),
                  ),
              ],
            ),
            SizedBox(height: defaultPadding),

            // Danh sách thẻ
            _filteredCardInfos.isEmpty
                ? Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Center(
                      child: Text(AppLocalizations.of(context).translate("There is no matching information")),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      columnSpacing: defaultPadding,
                      columns: widget.objectColumnName
                          .map((name) => DataColumn(
                                label: Text(
                                  AppLocalizations.of(context).translate(name),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ))
                          .toList(),
                      rows: List.generate(
                        _filteredCardInfos.length,
                        (index) => recentFileDataRow(
                          _filteredCardInfos[index],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
  DataRow recentFileDataRow(CardInfo fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.CardID)),
      DataCell(
        IconButton(
              icon: Icon(Icons.details, color: Colors.green),
              onPressed: ()=>_showDetailDialog(context, fileInfo),
            ),
      ),
    ],
  );
}
void _showDetailDialog(BuildContext context, CardInfo contract) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: CardDetail(object: contract, title: "CardList"), // Thay thế bằng widget chi tiết hợp đồng của bạn
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

// Hàm tạo hàng dữ liệu


