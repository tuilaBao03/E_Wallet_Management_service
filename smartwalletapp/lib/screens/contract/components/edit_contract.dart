

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';

class ContractCardFormScreen extends StatefulWidget {
  final String token;
  final String title;
  final String clientIdentifier;

  const ContractCardFormScreen({
    super.key, required this.token, required this.title, required this.clientIdentifier,
  });

  @override
  State<ContractCardFormScreen> createState() => _ContractCardFormScreenState();
}

class _ContractCardFormScreenState extends State<ContractCardFormScreen> {
  late TextEditingController reasonController;
  late TextEditingController clientIdentifierController;
  late TextEditingController clientSearchMethodController;
  late TextEditingController branchController;
  late TextEditingController institutionCodeController;
  late TextEditingController productCodeController;
  late TextEditingController productCode2Controller;
  late TextEditingController productCode3Controller;
  late TextEditingController contractNameController;
  late TextEditingController cbsNumberController;
  late TextEditingController customDataController;

  @override
  void initState() {
    super.initState();

    reasonController = TextEditingController(text: "to test");
    clientIdentifierController = TextEditingController(text: widget.clientIdentifier);
    clientSearchMethodController = TextEditingController(text: "CLIENT_NUMBER");
    branchController = TextEditingController(text: "0101");
    institutionCodeController = TextEditingController(text: "0001");
    productCodeController = TextEditingController(text: "");
    productCode2Controller = TextEditingController(text: "");
    productCode3Controller = TextEditingController(text: "");
    contractNameController = TextEditingController(text: "Liab");
    cbsNumberController = TextEditingController(text:"");
    customDataController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    reasonController.dispose();
    clientIdentifierController.dispose();
    clientSearchMethodController.dispose();
    branchController.dispose();
    institutionCodeController.dispose();
    productCodeController.dispose();
    productCode2Controller.dispose();
    productCode3Controller.dispose();
    contractNameController.dispose();
    cbsNumberController.dispose();
    customDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomTextField(controller: reasonController, label: 'Reason'),
                    CustomTextField(controller: clientIdentifierController, label: 'Client Identifier'),
                    CustomTextField(controller: clientSearchMethodController, label: 'Client Search Method'),
                    CustomTextField(controller: branchController, label: 'Branch'),
                    CustomTextField(controller: institutionCodeController, label: 'Institution Code'),
                  ],
                ),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Column(
                  children: [
                    CustomTextField(controller: productCodeController, label: 'Product Code'),
                    CustomTextField(controller: productCode2Controller, label: 'Product Code 2'),
                    CustomTextField(controller: productCode3Controller, label: 'Product Code 3'),
                    CustomTextField(controller: contractNameController, label: 'Contract Name'),
                    CustomTextField(controller: cbsNumberController, label: 'CBS Number'),
                    CustomTextField(controller: customDataController, label: 'Custom Data'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(label),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
        ),
      ),
    );
  }}