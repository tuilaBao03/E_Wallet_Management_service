import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartwalletapp/request/card_holder_data.dart';
import 'package:smartwalletapp/request/create_cardholder_request.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';

class EditCustomer extends StatefulWidget {
  final String token;
  final bool isDetail;
  final bool isAdd;
  final String title;
  final CreateCardHolderRequest? object; // Có thể null nếu thêm mới

  const EditCustomer({
    super.key,
    required this.token,
    required this.isDetail,
    required this.isAdd,
    required this.title,
    this.object, // Để null khi add mới
  });

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  late CreateCardHolderRequest _objectInfo; // Object dùng để binding dữ liệu
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    // Nếu add mới thì tạo object rỗng, còn detail thì lấy object truyền vào
    _objectInfo = widget.object ?? emptyCardHolder_ADD;
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context).translate(widget.title), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.save, color: isChanged ? Colors.blue : Colors.grey),
                      onPressed: (){}
                    ),
                    if (widget.isDetail)
                      IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                  ],
                )
              ],
            ),
            SizedBox(height: defaultPadding),
            ObjectDetailInfor(
              objectInfo: _objectInfo,
              token: widget.token,
              isDetail: widget.isDetail,
              onChanged: onChanged, // callback khi đổi dữ liệu
            ),
          ],
        ),
      ),
    );
  }
}

class ObjectDetailInfor extends StatefulWidget {
  final CreateCardHolderRequest objectInfo;
  final String token;
  final bool isDetail;
  final Function() onChanged; // Không cần truyền controller ra ngoài nữa

  const ObjectDetailInfor({super.key, required this.objectInfo, required this.token, required this.isDetail, required this.onChanged});

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

  TextEditingController _buildController(String fieldName, String initialValue) {
    final controller = TextEditingController(text: initialValue);
    controller.addListener(() {
      widget.objectInfo.setValueByField(fieldName, controller.text); // Gán thẳng giá trị vào object
      widget.onChanged(); // Bắn sự kiện thay đổi
    });
    return controller;
  }

  void _initializeControllers() {
    controllers = {
      for (var field in CreateCardHolderRequest.getFieldNames())
        field: _buildController(field, widget.objectInfo.getValueByField(field))
    };

    // Nếu là chi tiết thì load customData
    if (widget.isDetail) {
      for (var data in widget.objectInfo.customData) {
        dynamicFields.add({
          'tagName': TextEditingController(text: data.tagName)..addListener(() {
            data.tagName = dynamicFields.last['tagName']!.text;
            widget.onChanged();
          }),
          'tagValue': TextEditingController(text: data.tagValue)..addListener(() {
            data.tagValue = dynamicFields.last['tagValue']!.text;
            widget.onChanged();
          }),
        });
      }
    }
  }

  void _addNewInputField() {
    SetCustomDataInObjectJson newData = SetCustomDataInObjectJson(tagName: '', tagValue: '', addInfoType: 'AddInfo01');
    widget.objectInfo.customData.add(newData);
    setState(() {
      dynamicFields.add({
        'tagName': TextEditingController()..addListener(() {
          newData.tagName = dynamicFields.last['tagName']!.text;
          widget.onChanged();
        }),
        'tagValue': TextEditingController()..addListener(() {
          newData.tagValue = dynamicFields.last['tagValue']!.text;
          widget.onChanged();
        }),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final regexPatterns = {
      'eMail': r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      'mobilePhone': r'^\d{10,15}$',
      'identityCardNumber': r'^\d+$',
      'socialSecurityNumber': r'^\d+$'
    };
    final dateFields = ['birthDate'];

    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          ...controllers.entries.map((entry) => CustomTextField(
                controller: entry.value,
                title: entry.key,
                regex: regexPatterns[entry.key],
                isDate: dateFields.contains(entry.key),
              )),
          ...dynamicFields.map((map) => Row(
                children: [
                  Expanded(child: CustomTextField(controller: map['tagName']!, title: 'TagName')),
                  const SizedBox(width: 10),
                  Expanded(child: CustomTextField(controller: map['tagValue']!, title: 'TagValue')),
                ],
              )),
          TextButton.icon(
            onPressed: _addNewInputField,
            icon: const Icon(Icons.add, color: Colors.blue),
            label: const Text("Thêm thông tin bổ sung", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var c in controllers.values) {
      c.dispose();
    }
    dynamicFields.expand((map) => map.values).forEach((c) => c.dispose());
    super.dispose();
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
