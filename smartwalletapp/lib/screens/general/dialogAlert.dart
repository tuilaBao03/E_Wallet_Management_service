import 'package:flutter/material.dart';

class InputDialog {
  static Future<void> show(BuildContext context,
      {String title = 'Thông báo', required String content}) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content), // Hiển thị nội dung truyền vào
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
            ),
          ],
        );
      },
    );
  }
}
