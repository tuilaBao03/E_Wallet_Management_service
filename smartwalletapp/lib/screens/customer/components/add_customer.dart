import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_bloc.dart';
import 'package:smartwalletapp/bloc/CardHolder/card_holder_event.dart';
import 'package:smartwalletapp/request/card_holder_data.dart';
import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';

class AddCustomer extends StatefulWidget {
  final String token;
  final String title; // Có thể null nếu thêm mới

  const AddCustomer({
    super.key,
    required this.token,
    required this.title,// Để null khi add mới
  });

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  late CreateCardHolderRequest _objectInfo; // Object dùng để binding dữ liệu
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    // Nếu add mới thì tạo object rỗng, còn detail thì lấy object truyền vào
    _objectInfo = emptyCardHolder_ADD;
  }

  void onChanged() {
    setState(() {
      isChanged = true; // Chỉ cần biết có thay đổi là đủ
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
              children: [
                IconButton(
                  icon: Icon(Icons.save, color: isChanged ? Colors.blue : Colors.grey),
                  onPressed: isChanged ? () => context.read<CardHolderBloc>().add(AddCardHolderEvent(_objectInfo, widget.token)) : null,
                ),
              ],
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: defaultPadding),
                  ObjectDetailInfor(
                    objectInfo: _objectInfo,
                    token: widget.token,
                    onChanged: onChanged, // callback khi đổi dữ liệu
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ObjectDetailInfor extends StatefulWidget {
  final CreateCardHolderRequest objectInfo;
  final String token;
  final Function() onChanged;

  const ObjectDetailInfor({super.key, required this.objectInfo, required this.token, required this.onChanged});

  @override
  State<ObjectDetailInfor> createState() => _ObjectDetailInforState();
}

class _ObjectDetailInforState extends State<ObjectDetailInfor> {
    
  late Map<String, TextEditingController> controllers;
  List<Map<String, TextEditingController>> dynamicFields = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    controllers = {
      for (var field in CreateCardHolderRequest.getFieldNames())
        field: _buildController(field, widget.objectInfo.getValueByField(field))
    };
  }

 void _addNewInputField() {
  setState(() {
    // Tạo đối tượng mới cho customData
    SetCustomDataInObjectJson newData = SetCustomDataInObjectJson(
      tagName: '',
      tagValue: '',
      addInfoType: 'AddInfo01',
    );

    // Thêm vào danh sách dữ liệu chính
    widget.objectInfo.customData.add(newData);

    // Tạo TextEditingController và đảm bảo cập nhật đúng giá trị
    final tagNameController = TextEditingController();
    final tagValueController = TextEditingController();

    tagNameController.addListener(() {
      newData.tagName = tagNameController.text;
      widget.onChanged();
    });

    tagValueController.addListener(() {
      newData.tagValue = tagValueController.text;
      widget.onChanged();
    });

    // Thêm vào danh sách dynamicFields sau khi đã khởi tạo hoàn chỉnh
    dynamicFields.add({
      'tagName': tagNameController,
      'tagValue': tagValueController,
    });
  });
}

  TextEditingController _buildController(String fieldName, String initialValue) {
    final controller = TextEditingController(text: initialValue);
    controller.addListener(() {
      widget.objectInfo.setValueByField(fieldName, controller.text);
      widget.onChanged();
    });
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final column1 = ["reason", "institutionCode", "branch", "clientTypeCode", "clientCategory", "serviceGroup", "productCategory", "languageCode", "salutationCode", "salutationSuffix", "shortName", "firstName", "lastName", "middleName", "maritalStatusCode", "gender"];
    final column2 = ["socialSecurityNumber", "birthDate", "birthPlace", "birthName", "citizenship", "taxBracket", "individualTaxpayerNumber", "secretPhrase", "identityCardType", "identityCardNumber", "identityCardDetails", "clientNumber", "profession"];
    final column3 = ["companyName", "trademark", "department", "embossedTitleCode", "embossedFirstName", "embossedLastName", "embossedCompanyName", "eMail", "addressLine1", "addressLine2", "addressLine3", "addressLine4", "city", "homePhone", "mobilePhone", "businessPhone"];

    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(children: column1.map((field) => CustomTextField(controller: controllers[field]!, title: field)).toList())),
              const SizedBox(width: 10),
              Expanded(child: Column(children: column2.map((field) => CustomTextField(controller: controllers[field]!, title: field)).toList())),
              const SizedBox(width: 10),
              Expanded(child: Column(children: column3.map((field) => CustomTextField(controller: controllers[field]!, title: field)).toList())),
            ],
          ),
          const SizedBox(height: 10),
          ...dynamicFields.map((map) => Row(
                children: [
                  Expanded(child: CustomTextField(controller: map['tagName']!, title: 'TagName')),
                  const SizedBox(width: 10),
                  Expanded(child: CustomTextField(controller: map['tagValue']!, title: 'TagValue')),
                ],
              )),
          TextButton.icon(
            onPressed: () {
              _addNewInputField();

            },
            icon: const Icon(Icons.add, color: Colors.blue),
            label: const Text("Thêm thông tin bổ sung", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? regex;
  final bool isDate;

  const CustomTextField({super.key, required this.controller, required this.title, this.regex, this.isDate = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Khi mất focus thì check regex
        if (widget.regex != null && widget.controller.text.isNotEmpty) {
          final regExp = RegExp(widget.regex!);
          if (!regExp.hasMatch(widget.controller.text.trim())) {
            setState(() => errorText = 'Sai định dạng');
          } else {
            setState(() => errorText = null); // Hợp lệ
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        readOnly: widget.isDate,
        onTap: widget.isDate
            ? () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
                }
              }
            : null,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(widget.title),
          labelStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
          errorText: errorText,
        ),
      ),
    );
  }
  
}


