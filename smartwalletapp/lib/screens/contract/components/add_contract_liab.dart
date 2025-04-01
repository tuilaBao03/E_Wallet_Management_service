// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/request/create_contract_liab_request.dart';
import 'package:smartwalletapp/screens/general/dialogAlert.dart';

class CreateLiabContractFormScreen extends StatefulWidget {
  final String token;
  final String title;
  final String clientIdentifier;

  const CreateLiabContractFormScreen({
    super.key,
    required this.token,
    required this.title,
    required this.clientIdentifier,
  });

  @override
  State<CreateLiabContractFormScreen> createState() => _CreateLiabContractFormScreenState();
}

class _CreateLiabContractFormScreenState extends State<CreateLiabContractFormScreen> {
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

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  late List<ValueNotifier<bool>> errorNotifiers;

  @override
  void initState() {
    super.initState();

    reasonController = TextEditingController(text: "to test");
    clientIdentifierController = TextEditingController(text: widget.clientIdentifier);
    clientSearchMethodController = TextEditingController(text: "CLIENT_NUMBER");
    branchController = TextEditingController(text: "0101");
    institutionCodeController = TextEditingController(text: "0001");
    productCodeController = TextEditingController(text: "LIAB_TRAINING01");
    productCode2Controller = TextEditingController(text: "");
    productCode3Controller = TextEditingController(text: "");
    contractNameController = TextEditingController(text: "Liab");
    cbsNumberController = TextEditingController(text: "21324556600");
    customDataController = TextEditingController(text: "");

    controllers = [
      reasonController,
      clientIdentifierController,
      clientSearchMethodController,
      branchController,
      institutionCodeController,
      productCodeController,
      productCode2Controller,
      productCode3Controller,
      contractNameController,
      cbsNumberController,
      customDataController
    ];

    focusNodes = List.generate(controllers.length, (_) => FocusNode());
    errorNotifiers = List.generate(controllers.length, (_) => ValueNotifier<bool>(false));

    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addListener(() {
        errorNotifiers[i].value = controllers[i].text.isEmpty;
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var notifier in errorNotifiers) {
      notifier.dispose();
    }
    super.dispose();
  }

  void validateAndSave() {
    bool hasError = false;
    for (int i = 0; i < controllers.length; i++) {
      if (controllers[i].text.isEmpty) {
        errorNotifiers[i].value = true;
        focusNodes[i].requestFocus();
        hasError = true;
      }
    }

    if (hasError) {
      InputDialog.showError(
            context,
            title: 'Faile',
            content: "Enter all fields",
          );
    }

    CreateContractLiabRequest contract = CreateContractLiabRequest(
      reason: reasonController.text,
      clientIdentifier: clientIdentifierController.text,
      clientSearchMethod: clientSearchMethodController.text,
      contractInfo: CreateContractInObject(
        branch: branchController.text,
        institutionCode: institutionCodeController.text,
        productCode: productCodeController.text,
        productCode2: productCode2Controller.text,
        productCode3: productCode3Controller.text,
        contractName: contractNameController.text,
        cbsNumber: cbsNumberController.text,
      ),
      customData: customDataController.text,
    );

    context.read<ContractBloc>().add(AddLibContractEvent(widget.token, contract));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context).translate(widget.title)),
              IconButton(
                onPressed: validateAndSave,
                icon: Icon(Icons.save),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(controller: reasonController, label: 'Reason', focusNode: focusNodes[0], errorNotifier: errorNotifiers[0]),
                    CustomTextField(controller: clientIdentifierController, label: 'Client Identifier', focusNode: focusNodes[1], errorNotifier: errorNotifiers[1]),
                    CustomTextField(controller: clientSearchMethodController, label: 'Client Search Method', focusNode: focusNodes[2], errorNotifier: errorNotifiers[2]),
                    CustomTextField(controller: branchController, label: 'Branch', focusNode: focusNodes[3], errorNotifier: errorNotifiers[3]),
                    CustomTextField(controller: institutionCodeController, label: 'Institution Code', focusNode: focusNodes[4], errorNotifier: errorNotifiers[4]),
                  ],
                ),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(controller: productCodeController, label: 'Product Code', focusNode: focusNodes[5], errorNotifier: errorNotifiers[5]),
                    CustomTextField(controller: productCode2Controller, label: 'Product Code 2', focusNode: focusNodes[6], errorNotifier: errorNotifiers[6]),
                    CustomTextField(controller: productCode3Controller, label: 'Product Code 3', focusNode: focusNodes[7], errorNotifier: errorNotifiers[7]),
                    CustomTextField(controller: contractNameController, label: 'Contract Name', focusNode: focusNodes[8], errorNotifier: errorNotifiers[8]),
                    CustomTextField(controller: cbsNumberController, label: 'CBS Number', focusNode: focusNodes[9], errorNotifier: errorNotifiers[9]),
                  ],
                ),
              ),
            ],
          ),
          CustomTextField(controller: customDataController, label: 'Custom Data', focusNode: focusNodes[10], errorNotifier: errorNotifiers[10]),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FocusNode focusNode;
  final ValueNotifier<bool> errorNotifier;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.focusNode,
    required this.errorNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ValueListenableBuilder<bool>(
        valueListenable: errorNotifier,
        builder: (context, hasError, child) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).translate(label),
              labelStyle: TextStyle(color: hasError ? Colors.red : Theme.of(context).colorScheme.onPrimary),
              border: OutlineInputBorder(borderSide: BorderSide(color: hasError ? Colors.red : Colors.grey)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: hasError ? Colors.red : Colors.blue, width: 2)),
            ),
          );
        },
      ),
    );
  }
}
