// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFields extends StatefulWidget {
  final TextEditingController editController;
  final String title;

  const TextFields({super.key, required this.editController, required this.title});

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  late FocusNode focusNode;
  bool isPasswordVisible = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  // Regex kiểm tra password (ít nhất 1 chữ hoa, 1 ký tự đặc biệt, tối thiểu 6 ký tự)
  bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[@#$%^&*])[A-Za-z\d@#$%^&*]{6,}$');
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    bool isPassword = widget.title.toLowerCase().contains("password");
    bool isPhone = widget.title.toLowerCase().contains("phone") || widget.title.toLowerCase().contains("số điện thoại");

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            controller: widget.editController,
            focusNode: focusNode,
            obscureText: isPassword && !isPasswordVisible,
            keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
            inputFormatters: isPhone ? [FilteringTextInputFormatter.digitsOnly] : null,
            onChanged: (value) {
              if (isPassword) {
                setState(() {
                  errorMessage = isValidPassword(value) ? null : "Mật khẩu phải có chữ hoa và ký tự đặc biệt";
                });
              }
            },
            decoration: InputDecoration(
              
              labelText: widget.title,
              labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
              ),
              errorText: errorMessage,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
