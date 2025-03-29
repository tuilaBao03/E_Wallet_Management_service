import 'package:flutter/material.dart';

class InputDialog {
  static Future<void> showError(
    BuildContext context, {
    String title = 'Alert Dialog',
    required String content,
    VoidCallback? onPressHidden1,
    VoidCallback? onPressHidden2,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.error, color: Colors.red),
          content: Text(content), // Hiển thị nội dung truyền vào
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
                onPressHidden1?.call(); // Gọi hàm ẩn nếu có
                onPressHidden2?.call(); // Gọi hàm ẩn nếu có
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showSuccess(
    BuildContext context, {
    String title = 'Alert Dialog',
    required String content,
    VoidCallback? onPressHidden1,
    VoidCallback? onPressHidden2,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(Icons.info, color: Colors.lightGreen),
          content: Text(content), // Hiển thị nội dung truyền vào
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
                onPressHidden1?.call(); // Gọi hàm ẩn nếu có
                onPressHidden2?.call(); // Gọi hàm ẩn nếu có
              },
            ),
          ],
        );
      },
    );
  }
}