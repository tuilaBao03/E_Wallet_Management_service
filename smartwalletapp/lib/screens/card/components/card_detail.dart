import 'package:flutter/material.dart';
import 'package:smartwalletapp/models/card.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';

class CardDetailScreen extends StatefulWidget {
  final Cards cardInfo;
  final bool isDetail;

  const CardDetailScreen({
    super.key,
    required this.cardInfo,
    required this.isDetail,
  });

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  late Map<String, TextEditingController> controllers;
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    controllers = {
      for (var field in Cards.getFieldNames())
        field: _buildController(field, widget.cardInfo.getValueByField(field))
    };
  }

  TextEditingController _buildController(String fieldName, String initialValue) {
    final controller = TextEditingController(text: initialValue);
    controller.addListener(() {
      widget.cardInfo.setValueByField(fieldName, controller.text);
      setState(() => isChanged = true);
    });
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("Card Detail")),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: isChanged ? Colors.blue : Colors.grey),
            onPressed: isChanged ? () => _saveChanges() : null,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: controllers.entries
                .map((entry) => CustomTextField(
                      controller: entry.value,
                      title: entry.key,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    // Xử lý lưu thông tin thẻ
    setState(() => isChanged = false);
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(title),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
        ),
      ),
    );
  }
}
