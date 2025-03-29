import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/request/create_contract_card_request.dart';

class CreateCardContractFormScreen extends StatefulWidget {
  final String token;
  final String title;

  const CreateCardContractFormScreen({
    super.key,
    required this.token,
    required this.title,
  });

  @override
  State<CreateCardContractFormScreen> createState() => _CreateCardContractFormScreenState();
}

class _CreateCardContractFormScreenState extends State<CreateCardContractFormScreen> {
    late TextEditingController contractSearchMethodController = TextEditingController();
  late TextEditingController contractIdentifierController = TextEditingController();
  late TextEditingController productCodeController =  TextEditingController();
  late TextEditingController productCode2Controller = TextEditingController();
  late TextEditingController productCode3Controller = TextEditingController();
  late TextEditingController cardNameController = TextEditingController();
  late TextEditingController cbsNumberController = TextEditingController();
  late TextEditingController embossedFirstNameController = TextEditingController();
  late TextEditingController embossedLastNameController = TextEditingController();
  late TextEditingController embossedCompanyNameController = TextEditingController();

    @override
  void initState() {
    super.initState();
    contractSearchMethodController.text = "CONTRACT_NUMBER";
    contractIdentifierController.text = "";
    productCodeController.text = "CARD_TRAINING01";
    productCode2Controller.text = "";
    productCode3Controller.text = "";
    cardNameController.text = "Card Contract";
    cbsNumberController.text = "";
    embossedFirstNameController.text = "Phan";
    embossedLastNameController.text = "Hong";
    embossedCompanyNameController.text = "OpenWay";
  }


  @override
  void dispose() {
    contractSearchMethodController.dispose();
    contractIdentifierController.dispose();
    productCodeController.dispose();
    productCode2Controller.dispose();
    productCode3Controller.dispose();
    cardNameController.dispose();
    cbsNumberController.dispose();
    embossedFirstNameController.dispose();
    embossedLastNameController.dispose();
    embossedCompanyNameController.dispose();
    super.dispose();
  }

  void validateAndSave() {
    CreateCardV3 cardContract = CreateCardV3(
      contractSearchMethod: contractSearchMethodController.text,
      contractIdentifier: contractIdentifierController.text,
      productCode: productCodeController.text,
      productCode2: productCode2Controller.text,
      productCode3: productCode3Controller.text,
      inObject: InObjectCard(
        cardName: cardNameController.text,
        cbsNumber: cbsNumberController.text,
        embossedFirstName: embossedFirstNameController.text,
        embossedLastName: embossedLastNameController.text,
        embossedCompanyName: embossedCompanyNameController.text,
      ),
    );
    context.read<ContractBloc>().add(AddCardContractEvent(widget.token, cardContract));
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
              Column(
                children: [

                  Center(child: Text(AppLocalizations.of(context).translate("General Info")),),
                  TextField(controller: contractSearchMethodController, decoration: InputDecoration(labelText: 'Contract Search Method')),
                  TextField(controller: contractIdentifierController, decoration: InputDecoration(labelText: 'Contract Identifier')),
                  TextField(controller: productCodeController, decoration: InputDecoration(labelText: 'Product Code')),
                  TextField(controller: productCode2Controller, decoration: InputDecoration(labelText: 'Product Code 2')),
                  TextField(controller: productCode3Controller, decoration: InputDecoration(labelText: 'Product Code 3')),
                ],
              ),
              SizedBox(width: 10,),

              Column(
                children: [
                  Center(child: Text(AppLocalizations.of(context).translate("Issue Info")),),
                  TextField(controller: cardNameController, decoration: InputDecoration(labelText: 'Card Name')),
                  TextField(controller: cbsNumberController, decoration: InputDecoration(labelText: 'CBS Number')),
                  TextField(controller: embossedFirstNameController, decoration: InputDecoration(labelText: 'Embossed First Name')),
                  TextField(controller: embossedLastNameController, decoration: InputDecoration(labelText: 'Embossed Last Name')),
                  TextField(controller: embossedCompanyNameController, decoration: InputDecoration(labelText: 'Embossed Company Name')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}