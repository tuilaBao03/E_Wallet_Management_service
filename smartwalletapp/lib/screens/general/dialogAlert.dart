import 'package:flutter/material.dart';

class InputDialog {
  static Future<void> showError(BuildContext context,
      {String title = 'Alert Dialog', required String content}) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.error,color: Colors.red,),
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
  static Future<void> showSuccess(BuildContext context,
      {String title = 'Alert Dialog', required String content}) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.info,color: Colors.lightGreen,),
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
