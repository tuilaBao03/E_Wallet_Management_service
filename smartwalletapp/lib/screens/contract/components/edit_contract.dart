import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/request/edit_contract_request.dart';
import 'package:smartwalletapp/response/contract/get_contract_custom_response.dart';

class EditContractForm extends StatefulWidget {
  final GetContractResponseCustom contract;
  final String token;
  const EditContractForm({super.key, required this.token, required this.contract});

  @override
  _EditContractFormState createState() => _EditContractFormState();
}

class _EditContractFormState extends State<EditContractForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController contractSearchMethodController = TextEditingController(text: "CONTRACT_NUMBER");
  final TextEditingController contractIdentifierController = TextEditingController();
  final TextEditingController reasonController = TextEditingController(text: "to test");
  final TextEditingController contractNumberController = TextEditingController();
  final TextEditingController contractNameController = TextEditingController();
  final TextEditingController serviceGroupController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController cbsIdController = TextEditingController();
  final TextEditingController cbsNumberController = TextEditingController();
  final TextEditingController closeDateController = TextEditingController();
  final TextEditingController addInfoTypeController = TextEditingController();
  final TextEditingController removeTagController = TextEditingController();
  final TextEditingController tagNameController = TextEditingController();
  final TextEditingController tagValueController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contractIdentifierController.text = widget.contract.contractNumber;
    contractNameController.text = widget.contract.contractName;
    branchController.text = widget.contract.branch;
    serviceGroupController.text = widget.contract.serviceGroup;


  }

  void _saveContract() {
    if (_formKey.currentState!.validate()) {
      EditContractV4 request = EditContractV4(
        contractSearchMethod: contractSearchMethodController.text,
        contractIdentifier: contractIdentifierController.text,
        reason: reasonController.text,
        editContractInObject: EditContractInObjectEditV4(
          branch: branchController.text,
          serviceGroup: serviceGroupController.text,
          contractNumber: contractNumberController.text,
          contractName: contractNameController.text,
          cbsId: cbsIdController.text,
          cbsNumber: cbsNumberController.text,
          closeDate: closeDateController.text,
        ),
        customData: SetCustomDataInObjectEditV4(
          addInfoType: addInfoTypeController.text,
          removeTag: removeTagController.text,
          tagName: tagNameController.text,
          tagValue: tagValueController.text,
        ),
      );

      context.read<ContractBloc>().add(EditContractEvent(widget.token, request));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("Edit contract"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,  
        actions: [
          IconButton(
                onPressed: ()=>{
                  _saveContract()
                } ,
                icon: Icon(Icons.save,color: Colors.lightGreenAccent,),
              )
        ],
      ),
      body: Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        width: Get.width / 1.1,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: buildTextField('Contract Search Method', contractSearchMethodController),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: buildTextField('Contract Identifier', contractIdentifierController),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: buildTextField('Reason', reasonController),
                ),
              ],
            ),
            SizedBox(height: 16),

            Text('Contract Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      
                      buildTextField('Contract Number', contractNumberController),
                      buildTextField('Contract Name', contractNameController),
                      
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [

                      buildTextField('Service Group', serviceGroupController),
                      buildTextField('Branch', branchController),
                    ],
                  ),
                ),
              ],
            ),
            Text('Custom Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: buildTextField('Additional Info Type', addInfoTypeController),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: buildTextField('Remove Tag', removeTagController),),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: buildTextField('Tag Name', tagNameController),
                ),
                Expanded(
                  flex: 1,
                  child: buildTextField('Tag Value', tagValueController),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('System Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             Row(
              children: [
                Expanded(
                  flex: 1,
                  child: buildTextField('CBS ID', cbsIdController),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: buildTextField('CBS Number', cbsNumberController),),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: buildTextField('Close Date', closeDateController),
                ),
              ],
            ),
            

          ],
        ),
      ),
    ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(label),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
