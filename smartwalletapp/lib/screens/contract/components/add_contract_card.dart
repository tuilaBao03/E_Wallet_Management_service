import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/bloc/Contract/contract_bloc.dart';
import 'package:smartwalletapp/bloc/Contract/contract_event.dart';
import 'package:smartwalletapp/request/create_contract_card_request.dart';

class CreateCardContractFormScreen extends StatefulWidget {
  final String token;
  final String title;
  final String contractIdentifier;

  const CreateCardContractFormScreen({
    super.key,
    required this.token,
    required this.title, required this.contractIdentifier,
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
    contractIdentifierController.text = widget.contractIdentifier;
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
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text(AppLocalizations.of(context).translate("Add Card Contract"))), 
        actions: [
          IconButton(onPressed: validateAndSave, icon: Icon(Icons.save, color: Colors.white,))
          ],
          automaticallyImplyLeading: false,  
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10,),
                    Center(child: Text(AppLocalizations.of(context).translate("General Info"), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                    SizedBox(height: 10,),
                    _buildCustomTextField(contractSearchMethodController,  'Contract Search Method'),
                    SizedBox(height: 10,),
                    _buildCustomTextField(contractIdentifierController, 'Contract Identifier'),
                    SizedBox(height: 10,),
                    _buildCustomTextField(productCodeController,'Product Code'),
                    SizedBox(height: 10,),
                    _buildCustomTextField( productCode2Controller, 'Product Code 2'),
                    SizedBox(height: 10,),
                    _buildCustomTextField(productCode3Controller, 'Product Code 3'),
                    SizedBox(height: 10,),
                  ],
                ),),
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        AppLocalizations.of(context).translate("Issue Info"),
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), // Đổi màu text
                      ),
                    ),
                    _buildCustomTextField(cardNameController, "Card Name"),
                    SizedBox(height: 10,),
                    _buildCustomTextField(cbsNumberController, "CBS Number"),
                    SizedBox(height: 10,),
                    _buildCustomTextField(embossedFirstNameController, "Embossed First Name"),
                    SizedBox(height: 10,),
                    _buildCustomTextField(embossedLastNameController, "Embossed Last Name"),
                    SizedBox(height: 10,),
                    _buildCustomTextField(embossedCompanyNameController, "Embossed Company Name"),
                  ],
                ),),

              
            ],
          ),
        ],
      ),
    )
  ,
    );
    }
    Widget _buildCustomTextField(TextEditingController controller, String label) {
    return TextFormField(
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
    );
  }
}