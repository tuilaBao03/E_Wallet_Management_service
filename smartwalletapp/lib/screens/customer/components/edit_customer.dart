// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/request/edit_cardholder_request.dart';

class EditClientForm extends StatefulWidget {
  final String clientIdentifier;
  final String token;

  const EditClientForm({super.key, required this.clientIdentifier, required this.token});
  @override
  _EditClientFormState createState() => _EditClientFormState();
}

class _EditClientFormState extends State<EditClientForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobilePhoneController = TextEditingController();
  final TextEditingController identityCardController = TextEditingController();
  final TextEditingController socialSecurityController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final regexPatterns = {
    'eMail': r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    'mobilePhone': r'^\d{10,15}$',
    'identityCardNumber': r'^\d+$',
    'socialSecurityNumber': r'^\d+$'
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextField('Email', emailController, regexPatterns['eMail']),
          buildTextField('Mobile Phone', mobilePhoneController, regexPatterns['mobilePhone']),
          buildTextField('First Name', firstNameController, null),
          buildTextField('Last Name', lastNameController, null),
          buildTextField('Birth Date', birthDateController, null),
          buildTextField('Address', addressController, null),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {

                EditClientV6 request = EditClientV6(
                  clientSearchMethod: "CLIENT_NUMBER",
                  clientIdentifier: widget.clientIdentifier,
                  reason: "TO TEST",
                  editClientInObject: EditClientInObjectEditV6(
                    email: emailController.text.isEmpty ? " " : emailController.text,
                    mobilePhone: mobilePhoneController.text.isEmpty ? " " : mobilePhoneController.text,
                    firstName: firstNameController.text.isEmpty ? " " : firstNameController.text,
                    lastName: lastNameController.text.isEmpty ? " " : lastNameController.text,
                    birthDate: birthDateController.text.isEmpty ? " " : birthDateController.text,
                    address: addressController.text.isEmpty ? " " : addressController.text,
                    branch: "",
                    clientCategory: "", 
                    serviceGroup: "", 
                    productCategory: "",
                    clientTypeCode: "",
                    shortName: "",
                    salutationCode: "",
                    salutationSuffix: "", 
                    gender: "", 
                    middleName:"", 
                    birthPlace: "", 
                    birthName: "", 
                    languageCode: "", 
                    citizenship: "", 
                    maritalStatusCode: "", 
                    taxBracket: "", 
                    individualTaxpayerNumber: "", 
                    dateExpire: "", 
                    homePhone: "", 
                    businessPhone: "", 
                    country: "", 
                    state: "", 
                    city: "", 
                    addressZip: "", 
                    addressLine1: "", 
                    profession: "", 
                    embossedLastName: "embossedLastName", 
                    embossedFirstName: ""),
                  setCustomDataInObject: SetCustomDataInObjectEditV6(addInfoType: "",
                    removeTag: "",
                    tagName: "",
                    tagValue: ""));
                context.read<CardHolderBloc>().add(EditCardHolderEvent(request,widget.token));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String? pattern) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        } else if (pattern != null && !RegExp(pattern).hasMatch(value)) {
          return 'Invalid $label';
        }
        return null;
      },
    );
  }
}
