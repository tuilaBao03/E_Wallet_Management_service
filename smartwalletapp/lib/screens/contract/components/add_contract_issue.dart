import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContractV4ReqV2 {
  String liabCategory;
  String liabContractSearchMethod;
  String liabContractIdentifier;
  String clientSearchMethod;
  String clientIdentifier;
  String productCode;
  String productCode2;
  String productCode3;
  InObject inObject;

  CreateContractV4ReqV2({
    required this.liabCategory,
    required this.liabContractSearchMethod,
    required this.liabContractIdentifier,
    required this.clientSearchMethod,
    required this.clientIdentifier,
    required this.productCode,
    required this.productCode2,
    required this.productCode3,
    required this.inObject,
  });
}

class InObject {
  String branch;
  String institutionCode;
  String contractName;
  String cbsNumber;
  String addInfo01;
  String addInfo02;

  InObject({
    required this.branch,
    required this.institutionCode,
    required this.contractName,
    required this.cbsNumber,
    required this.addInfo01,
    required this.addInfo02,
  });
}

class AddIsissueContractFormScreen extends StatefulWidget {
  final String token;
  final String title;

  const AddIsissueContractFormScreen({
    super.key,
    required this.token,
    required this.title,
  });

  @override
  State<AddIsissueContractFormScreen> createState() => _AddIsissueContractFormScreenState();
}

class _AddIsissueContractFormScreenState extends State<AddIsissueContractFormScreen> {
  late TextEditingController liabCategoryController = TextEditingController(text: "");
  late TextEditingController liabContractSearchMethodController = TextEditingController(text: "");
  late TextEditingController liabContractIdentifierController = TextEditingController(text: "");
  late TextEditingController clientSearchMethodController = TextEditingController(text: "");
  late TextEditingController clientIdentifierController = TextEditingController(text: "");
  late TextEditingController productCodeController = TextEditingController(text: "");
  late TextEditingController productCode2Controller = TextEditingController(text: "");
  late TextEditingController productCode3Controller = TextEditingController(text: "");
  late TextEditingController branchController = TextEditingController(text: "");
  late TextEditingController institutionCodeController = TextEditingController(text: "");
  late TextEditingController contractNameController = TextEditingController(text: "");
  late TextEditingController cbsNumberController = TextEditingController(text: "");
  late TextEditingController addInfo01Controller = TextEditingController(text: "");
  late TextEditingController addInfo02Controller = TextEditingController(text: "");

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
