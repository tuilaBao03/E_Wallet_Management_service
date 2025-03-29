// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SizeDropdown extends StatefulWidget {
  final Function(int?)? onSizeSelected; // Callback truyền giá trị ra ngoài

  const SizeDropdown({super.key, this.onSizeSelected});

  @override
  _SizeDropdownState createState() => _SizeDropdownState();
}

class _SizeDropdownState extends State<SizeDropdown> {
  List<int> sizes = [10, 15,20];
  int? selectedSize = 10; // Giá trị mặc định là 10

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedSize, // Giá trị mặc định
      hint: Text("Chọn kích thước"), // Gợi ý khi chưa chọn
      onChanged: (int? newValue) {
        setState(() {
          selectedSize = newValue;
        });

        // Gọi callback nếu có
        if (widget.onSizeSelected != null) {
          widget.onSizeSelected!(newValue);
        }
      },
      items: sizes.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()), // Hiển thị giá trị
        );
      }).toList(),
    );
  }
}
