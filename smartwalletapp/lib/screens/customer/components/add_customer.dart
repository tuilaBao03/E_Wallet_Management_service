import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/request/create_cardholder_request.dart';

class CreateClientForm extends StatefulWidget {
  final String token;
  const CreateClientForm({super.key, required this.token});

  @override
  _CreateClientFormState createState() => _CreateClientFormState();
}

class _CreateClientFormState extends State<CreateClientForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController reasonController =
      TextEditingController(text: "Create lient");
  final TextEditingController institutionCodeController =
      TextEditingController(text: "0001");
  final TextEditingController branchController =
      TextEditingController(text: "0101");
  final TextEditingController clientTypeCodeController =
      TextEditingController(text: "PR");
  final TextEditingController clientCategoryController =
      TextEditingController();
  final TextEditingController serviceGroupController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController languageCodeController = TextEditingController();
  final TextEditingController shortNameController =
      TextEditingController(text: "Ha Gia Bao");
  final TextEditingController firstNameController =
      TextEditingController(text: "Bao");
  final TextEditingController lastNameController =
      TextEditingController(text: "Ha");
  final TextEditingController middleNameController =
      TextEditingController(text: "Gia");
  final TextEditingController maritalStatusCodeController =
      TextEditingController(text: "D");
  final TextEditingController socialSecurityController =
      TextEditingController();
  final TextEditingController salutationController =
      TextEditingController(text: "MR");
  final TextEditingController birthdateController =
      TextEditingController(text: "2000-12-12");
  final TextEditingController genderController =
      TextEditingController(text: "F");
  final TextEditingController cityZenshipController =
      TextEditingController(text: "VNM");
  final TextEditingController individualTaxController = TextEditingController();
  final TextEditingController companyNameController =
      TextEditingController(text: "OPenWay");
  final TextEditingController idCardNumberController =
      TextEditingController(text: "1235846656255");
  final TextEditingController idCardDetailController =
      TextEditingController(text: "232445213hanoi");
  final TextEditingController clientNumberController = TextEditingController();
  final TextEditingController professionController =
      TextEditingController(text: "Thu Ky");
  final TextEditingController address1Controller =
      TextEditingController(text: "54 Lieu Giai Doi Can Ba Dinh");
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();
  final TextEditingController address4Controller = TextEditingController();
  final TextEditingController cityController =
      TextEditingController(text: "HaNoi");
  final TextEditingController homePhoneController =
      TextEditingController(text: "0888379199");
  final TextEditingController businessController =
      TextEditingController(text: "0888379199");
  final TextEditingController emailController =
      TextEditingController(text: "hagiabao980@gmail.com");
  final TextEditingController mobilePhoneController =
      TextEditingController(text: "0888379199");

  List<Map<String, TextEditingController>> customDataControllers = [];

  @override
  void dispose() {
    reasonController.dispose();
    institutionCodeController.dispose();
    branchController.dispose();
    clientTypeCodeController.dispose();
    clientCategoryController.dispose();
    serviceGroupController.dispose();
    productCategoryController.dispose();
    languageCodeController.dispose();
    shortNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    maritalStatusCodeController.dispose();
    socialSecurityController.dispose();
    salutationController.dispose();
    birthdateController.dispose();
    genderController.dispose();
    cityZenshipController.dispose();
    individualTaxController.dispose();
    companyNameController.dispose();
    idCardNumberController.dispose();
    idCardDetailController.dispose();
    clientNumberController.dispose();
    professionController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    address3Controller.dispose();
    address4Controller.dispose();
    cityController.dispose();
    homePhoneController.dispose();
    businessController.dispose();
    emailController.dispose();
    mobilePhoneController.dispose();

    for (var map in customDataControllers) {
      map['tagName']?.dispose();
      map['tagValue']?.dispose();
    }

    super.dispose();
  }

  void addCustomDataField() {
    setState(() {
      customDataControllers.add({
        ''
            'tagName': TextEditingController(),
        'tagValue': TextEditingController(),
      });
    });
  }

  void removeCustomDataField(int index) {
    setState(() {
      customDataControllers[index]['tagName']?.dispose();
      customDataControllers[index]['tagValue']?.dispose();
      customDataControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Client Form'),
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  CreateClientV4Body request = CreateClientV4Body(
                    reason: reasonController.text,
                    createClientInObject: CreateClientInObject(
                        institutionCode: institutionCodeController.text,
                        branch: branchController.text,
                        clientTypeCode: clientTypeCodeController.text,
                        shortName: shortNameController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        middleName: middleNameController.text,
                        maritalStatusCode: maritalStatusCodeController.text,
                        socialSecurityNumber: socialSecurityController.text,
                        salutationCode: salutationController.text,
                        birthDate: birthdateController.text,
                        gender: genderController.text,
                        citizenship: cityZenshipController.text,
                        individualTaxpayerNumber: individualTaxController.text,
                        companyName: companyNameController.text,
                        identityCardNumber: idCardDetailController.text,
                        identityCardDetails: idCardDetailController.text,
                        clientNumber: clientNumberController.text,
                        profession: professionController.text,
                        email: emailController.text,
                        addressLine1: address1Controller.text,
                        addressLine2: address2Controller.text,
                        addressLine3: address3Controller.text,
                        addressLine4: address4Controller.text,
                        city: cityController.text,
                        homePhone: homePhoneController.text,
                        mobilePhone: mobilePhoneController.text),
                    setCustomDataInObjects: customDataControllers.map((data) {
                      return SetCustomDataInObject(
                        addInfoType: "AddInfo01",
                        tagName: data['tagName']?.text ?? '',
                        tagValue: data['tagValue']?.text ?? '',
                      );
                    }).toList(),
                  );

                  context
                      .read<CardHolderBloc>()
                      .add(AddCardHolderEvent(request, widget.token));
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Color(0xFF2A2D3E),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Brand Infor",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: reasonController,
                            decoration: InputDecoration(
                              labelText: 'Reason',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 1,
                          child: TextFormField(
                              controller: institutionCodeController,
                              decoration: InputDecoration(
                                labelText: 'Institution Code',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ))),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                            controller: branchController,
                            decoration: InputDecoration(
                              labelText: 'Branch',
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Personal Infor",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: middleNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Middle Name',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: birthdateController,
                                  decoration: InputDecoration(
                                    labelText: 'Birthdate',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: genderController,
                                  decoration: InputDecoration(
                                    labelText: 'Gender',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: socialSecurityController,
                                  decoration: InputDecoration(
                                    labelText: 'Social Security Number',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: maritalStatusCodeController,
                                  decoration: InputDecoration(
                                    labelText: 'Marital Status',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                            ],
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: address1Controller,
                                  decoration: InputDecoration(
                                    labelText: 'Address Line 1',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: address2Controller,
                                  decoration: InputDecoration(
                                    labelText: 'Address Line 2',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: cityController,
                                  decoration: InputDecoration(
                                    labelText: 'City',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: homePhoneController,
                                  decoration: InputDecoration(
                                    labelText: 'Home Phone',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: businessController,
                                  decoration: InputDecoration(
                                    labelText: 'Business Phone',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                                  SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  }
                                  final emailRegex =
                                      RegExp(r'^[^@]+@[^@]+\.[^@]');
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: mobilePhoneController,
                                  decoration: InputDecoration(
                                    labelText: 'Mobile Phone',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Service Info",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormField(
                                  controller: clientTypeCodeController,
                                  decoration: InputDecoration(
                                    labelText: 'Client Type Code',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: idCardNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'IdentityCardNumber',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: idCardDetailController,
                                  decoration: InputDecoration(
                                    labelText: 'IdentityCardDetails',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                            ],
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormField(
                                  controller: productCategoryController,
                                  decoration: InputDecoration(
                                    labelText: 'Product Category',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: companyNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Company Name',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  controller: clientNumberController,
                                  decoration: InputDecoration(
                                    labelText: 'Client Number',
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Custom Data',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: customDataControllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: customDataControllers[index]
                                    ['tagName'],
                                decoration: InputDecoration(
                                  labelText: 'Tag Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: customDataControllers[index]
                                    ['tagValue'],
                                decoration: InputDecoration(
                                  labelText: 'Tag Value',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle, color: Colors.red),
                              onPressed: () => removeCustomDataField(index),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: addCustomDataField,
                    child: Text(
                      'Add Custom Data',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
