import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartwalletapp/models/create_contract_request.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppBloc.dart';
import 'package:smartwalletapp/bloc/MainApp/MainAppEvent.dart';
import 'package:smartwalletapp/constants.dart';
import 'package:smartwalletapp/app/locallization/app_localizations.dart';
import 'package:smartwalletapp/screens/main/components/classInitial.dart';

class ContractFormScreen extends StatefulWidget {
  final String token;
  final String title;

  const ContractFormScreen({
    super.key,
    required this.token,
    required this.title
  });

  @override
  State<ContractFormScreen> createState() => _ContractFormScreenState();
}

class _ContractFormScreenState extends State<ContractFormScreen> {
  late CreateContractRequest _contract;
  bool _isEdited = false;

  @override
  void initState() {
    super.initState();
    _contract = selectedContractInittial;
  }

  void _markAsEdited() {
    setState(() => _isEdited = true);
  }

  void _saveContract() {
    context.read<MainAppBloc>().add(AddContractEvent(_contract, widget.token));
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context).translate(widget.title),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              IconButton(
                icon: Icon(Icons.save, color: _isEdited ? Colors.blue : Colors.grey),
                onPressed: _isEdited ? _saveContract : null,
              ),
            ],
          ),
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class ContractFormFields extends StatefulWidget {
  final CreateContractRequest contract;
  final bool isReadOnly;
  final VoidCallback onEdited;

  const ContractFormFields({
    super.key,
    required this.contract,
    required this.isReadOnly,
    required this.onEdited,
  });

  @override
  State<ContractFormFields> createState() => _ContractFormFieldsState();
}

class _ContractFormFieldsState extends State<ContractFormFields> {
  late Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers = {
      for (var field in CreateContractRequest.getFieldNames())
        field: TextEditingController(text: widget.contract.getValueByField(field))
          ..addListener(() {
            widget.contract.setValueByField(field, _controllers[field]!.text);
            widget.onEdited();
          })
    };
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fields = _controllers.entries.toList();

    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              // Cột 1
              Expanded(
                child: Column(
                  children: fields.sublist(0, fields.length ~/ 2).map((entry) => CustomTextField(
                        controller: entry.value,
                        label: entry.key,
                        isReadOnly: widget.isReadOnly,
                      )).toList(),
                ),
              ),
              SizedBox(width: defaultPadding),
              // Cột 2
              Expanded(
                child: Column(
                  children: fields.sublist(fields.length ~/ 2).map((entry) => CustomTextField(
                        controller: entry.value,
                        label: entry.key,
                        isReadOnly: widget.isReadOnly,
                      )).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isReadOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        readOnly: isReadOnly,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate(label),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
        ),
      ),
    );
  }
}
