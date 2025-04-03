import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as context;
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/request/create_contract_issue_request.dart';
class AddIssueContractFormScreen extends StatefulWidget {
  final String token;
  final String title;
  final String liabContractIdentifier;
  final String clientIdentifier;

  const AddIssueContractFormScreen({
    super.key,
    required this.token,
    required this.title,
    required this.liabContractIdentifier,
    required this.clientIdentifier,
  });

  @override
  State<AddIssueContractFormScreen> createState() => _AddIssueContractFormScreenState();
}

class _AddIssueContractFormScreenState extends State<AddIssueContractFormScreen> {
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



  @override
  Widget build(BuildContext context) {
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
    context.read<ContractBloc>().add(AddIssueContractV2Event(widget.token, contract));
  }
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text("Add Issue Contract")),
        actions: [
          IconButton(onPressed: validateAndSave, icon: Icon(Icons.save, color: Colors.blue,))
        ],
        automaticallyImplyLeading: false,  
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _buildCustomTextField(liabCategoryController,  'Liability Category'),),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: _buildCustomTextField(liabContractSearchMethodController,'Liability Contract Search Method'),),
                  SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: _buildCustomTextField(liabContractIdentifierController,  'Liability Contract Identifier'), ),
                  SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child:_buildCustomTextField(clientSearchMethodController, 'Client Search Method'),),
                  SizedBox(width: 10,),

              ],
            ),
            Row(
          
              children: [
                Expanded(
                  flex: 1,
                  child: _buildCustomTextField(branchController,  'Branch'),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: _buildCustomTextField(institutionCodeController,  'Institution Code'),),
              
              ],
            ),
          
            
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Center(child: Text("General Info")),


                      
                      _buildCustomTextField(clientIdentifierController, 'Client Identifier'),
                      _buildCustomTextField(productCodeController,  'Product Code'),
                      _buildCustomTextField(productCode2Controller,  'Product Code 2'),
                      _buildCustomTextField( productCode3Controller,  'Product Code 3'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(child: Text("Issue Info")),
                      
                      _buildCustomTextField(contractNameController,  'Contract Name'),
                      _buildCustomTextField(cbsNumberController,  'CBS Number'),
                      _buildCustomTextField(addInfo01Controller,  'Additional Info 01'),
                      _buildCustomTextField(addInfo02Controller,  'Additional Info 02'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
            ),
      )
  ,
    );}
  Widget _buildCustomTextField(TextEditingController controller, String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white), // Màu chữ trắng
        cursorColor: Colors.white, // Màu con trỏ trắng
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white), // Màu label trắng
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // Viền trắng khi chưa chọn
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0), // Viền trắng khi focus
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0), // Viền đỏ khi lỗi
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5), // Viền đỏ khi focus lỗi
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }
}
