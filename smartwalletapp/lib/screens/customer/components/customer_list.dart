// ignore_for_file: file_names, library_private_types_in_public_api, prefer_final_fields, avoid_print

import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import '../../../constants.dart';
import '../../../models/user.dart';

class CustomerList extends StatefulWidget {
  final List<User> object;
  final String title;
  final HashSet<String> objectColumnName;
  final Function(User) onDetailSelected;
 

  const CustomerList({
    super.key, 
    required this.object, 
    required this.objectColumnName,
    required this.title,
    required this.onDetailSelected,
  });

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  TextEditingController _searchController = TextEditingController();
  List<User> _filteredUsers = [];

  

  @override
  void initState() {
    super.initState();
    _filteredUsers = widget.object;
  }

  void _searchUser() {
    setState(() {
      _filteredUsers = widget.object.where((user) =>
        user.firstName.toLowerCase().contains(_searchController.text.toLowerCase()) ||
        user.lastName.toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
    });
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
                    onChanged: (value) => _searchUser(),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.blue),
                  onPressed: _searchUser,
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
                  _filteredUsers.length,
                  (index) => recentFileDataRow(
                    _filteredUsers[index],
                    () {
                      widget.onDetailSelected(_filteredUsers[index]);
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

DataRow recentFileDataRow(User fileInfo, VoidCallback onDetail) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.firstName)),
      DataCell(Text(fileInfo.lastName)),
      DataCell(
        Row(
          children: [
        
            IconButton(
              icon: Icon(Icons.details, color: Colors.green),
              onPressed: onDetail,
            ),
          
          ],
        ),
      ),
    ],
  );
}
