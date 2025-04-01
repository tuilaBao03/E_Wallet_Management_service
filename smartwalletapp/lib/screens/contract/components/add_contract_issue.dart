import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/request/create_contract_issue_request.dart';
class AddIsissueContractFormScreen extends StatefulWidget {
  final String token;
  final String title;
  final String liabContractIdentifier;
  final String clientIdentifier;

  const AddIsissueContractFormScreen({
    super.key,
    required this.token,
    required this.title,
    required this.liabContractIdentifier,
    required this.clientIdentifier,
  });

  @override
  State<AddIsissueContractFormScreen> createState() => _AddIsissueContractFormScreenState();
}

class _AddIsissueContractFormScreenState extends State<AddIsissueContractFormScreen> {
  late TextEditingController liabCategoryController = TextEditingController(text: "Y");
  late TextEditingController liabContractSearchMethodController = TextEditingController(text: "CONTRACT_NUMBER");
  late TextEditingController liabContractIdentifierController = TextEditingController(text: widget.liabContractIdentifier);
  late TextEditingController clientSearchMethodController = TextEditingController(text: "CLIENT_NUMBER");
  late TextEditingController clientIdentifierController = TextEditingController(text: widget.clientIdentifier);
  late TextEditingController productCodeController = TextEditingController(text: "ISSUING_TRAINING01");
  late TextEditingController productCode2Controller = TextEditingController(text: "");
  late TextEditingController productCode3Controller = TextEditingController(text: "");
  late TextEditingController branchController = TextEditingController(text: "0101");
  late TextEditingController institutionCodeController = TextEditingController(text: "0001");
  late TextEditingController contractNameController = TextEditingController(text: "Issuing Contract");
  late TextEditingController cbsNumberController = TextEditingController(text: "213245566000");
  late TextEditingController addInfo01Controller = TextEditingController(text: "PAYMENT_OPTION=MTP;START_DATE=0123;BANK=A1;ACCOUNT=A2;BANK_CODE=A3;ACC_NAME=A4;");
  late TextEditingController addInfo02Controller = TextEditingController(text: "PAYMENT_OPTION=MTP;");

  @override
  void dispose() {
    liabCategoryController.dispose();
    liabContractSearchMethodController.dispose();
    liabContractIdentifierController.dispose();
    clientSearchMethodController.dispose();
    clientIdentifierController.dispose();
    productCodeController.dispose();
    productCode2Controller.dispose();
    productCode3Controller.dispose();
    branchController.dispose();
    institutionCodeController.dispose();
    contractNameController.dispose();
    cbsNumberController.dispose();
    addInfo01Controller.dispose();
    addInfo02Controller.dispose();
    super.dispose();
  }

  void validateAndSave() {
    CreateContractV4ReqV2 contract = CreateContractV4ReqV2(
      liabCategory: liabCategoryController.text,
      liabContractSearchMethod: liabContractSearchMethodController.text,
      liabContractIdentifier: liabContractIdentifierController.text,
      clientSearchMethod: clientSearchMethodController.text,
      clientIdentifier: clientIdentifierController.text,
      productCode: productCodeController.text,
      productCode2: productCode2Controller.text,
      productCode3: productCode3Controller.text,
      inObject: InObject(
        branch: branchController.text,
        institutionCode: institutionCodeController.text,
        contractName: contractNameController.text,
        cbsNumber: cbsNumberController.text,
        addInfo01: addInfo01Controller.text,
        addInfo02: addInfo02Controller.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          ElevatedButton(onPressed: validateAndSave, child: Text('Save')),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Center(child: Text("General Info")),
                    TextField(controller: liabCategoryController, decoration: InputDecoration(labelText: 'Liability Category')),
                    TextField(controller: liabContractSearchMethodController, decoration: InputDecoration(labelText: 'Liability Contract Search Method')),
                    TextField(controller: liabContractIdentifierController, decoration: InputDecoration(labelText: 'Liability Contract Identifier')),
                    TextField(controller: clientSearchMethodController, decoration: InputDecoration(labelText: 'Client Search Method')),
                    TextField(controller: clientIdentifierController, decoration: InputDecoration(labelText: 'Client Identifier')),
                    TextField(controller: productCodeController, decoration: InputDecoration(labelText: 'Product Code')),
                    TextField(controller: productCode2Controller, decoration: InputDecoration(labelText: 'Product Code 2')),
                    TextField(controller: productCode3Controller, decoration: InputDecoration(labelText: 'Product Code 3')),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Center(child: Text("Issue Info")),
                    TextField(controller: branchController, decoration: InputDecoration(labelText: 'Branch')),
                    TextField(controller: institutionCodeController, decoration: InputDecoration(labelText: 'Institution Code')),
                    TextField(controller: contractNameController, decoration: InputDecoration(labelText: 'Contract Name')),
                    TextField(controller: cbsNumberController, decoration: InputDecoration(labelText: 'CBS Number')),
                    TextField(controller: addInfo01Controller, decoration: InputDecoration(labelText: 'Additional Info 01')),
                    TextField(controller: addInfo02Controller, decoration: InputDecoration(labelText: 'Additional Info 02')),
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
