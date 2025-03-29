import 'package:flutter/material.dart';

class PageInfoWidget extends StatelessWidget {
  final int page;
  final int pageAmount;
  final VoidCallback onUpPress;
  final VoidCallback onDownPress;

  const PageInfoWidget({super.key, 
    required this.page,
    required this.pageAmount,
    required this.onUpPress,
    required this.onDownPress,
  });

  @override
  Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => page > 1 ? Colors.blue : Colors.grey,
          ),
        ),
        onPressed: page > 1 ? onDownPress : null, // Chỉ kích hoạt nếu page > 1
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
      SizedBox(width: 10),
      Text(
        "Page: $page / $pageAmount",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => page < pageAmount ? Colors.blue : Colors.grey,
          ),
        ),
        onPressed: page < pageAmount ? onUpPress : null, // Chỉ kích hoạt nếu page < pageAmount
        child: Icon(Icons.arrow_forward, color: Colors.white),
      ),
    ],
  );
}
}