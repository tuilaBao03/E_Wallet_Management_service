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
              onPressed: page > 1 ? onDownPress : null, // Chỉ kích hoạt nếu page > 1
              child: Icon(Icons.turn_right, color: Colors.white,),
            ),
            SizedBox(width: 10),
            Text(
              "Page: $page / $pageAmount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: page < pageAmount ? onUpPress : null, // Chỉ kích hoạt nếu page < pageAmount
              child: Icon(Icons.turn_left, color: Colors.white,),
            ),
          ],
        );
  }
}