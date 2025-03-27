import 'package:flutter/material.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_bloc.dart';
import 'package:smartwalletapp/bloc/MainApp/main_app_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';

class ContractEditScreen extends StatefulWidget {
  final String token;
  final bool isAdd;
  final String title;
  final CreateContractRequest? object;

  const ContractEditScreen({
    super.key,
    required this.token,
    required this.isAdd,
    required this.title,
    this.object,
  });

  @override
  State<ContractEditScreen> createState() => _ContractEditScreenState();
}

class _ContractEditScreenState extends State<ContractEditScreen> {
  late CreateContractRequest _contractInfo;
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    _contractInfo = widget.object ?? selectedContractInittial;
  }

  void onChanged() {
    setState(() => isChanged = true);
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
                IconButton(
                  icon: Icon(Icons.save, color: isChanged ? Colors.blue : Colors.grey),
                  onPressed: isChanged
                      ? () => context.read<MainAppBloc>().add(AddContractEvent(_contractInfo, widget.token))
                      : null,
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            ContractDetailInfo(
              contractInfo: _contractInfo,
              isDetail: !widget.isAdd,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class ContractDetailInfo extends StatefulWidget {
  final CreateContractRequest contractInfo;
  final bool isDetail;
  final Function() onChanged;

  const ContractDetailInfo({
    super.key,
    required this.contractInfo,
    required this.isDetail,
    required this.onChanged,
  });

  @override
  State<ContractDetailInfo> createState() => _ContractDetailInfoState();
}

class _ContractDetailInfoState extends State<ContractDetailInfo> {
  late Map<String, TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  TextEditingController _buildController(String fieldName, String initialValue) {
    final controller = TextEditingController(text: initialValue);
    controller.addListener(() {
      widget.contractInfo.setValueByField(fieldName, controller.text);
      widget.onChanged();
    });
    return controller;
  }

  void _initializeControllers() {
    controllers = {
      for (var field in CreateContractRequest.getFieldNames())
        field: _buildController(field, widget.contractInfo.getValueByField(field))
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          ...controllers.entries.map((entry) => CustomTextField(
                controller: entry.value,
                title: entry.key,
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(widget.title),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
          errorText: errorText,
        ),
      ),
    );
  }
}
