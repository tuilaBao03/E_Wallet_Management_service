import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final int page;
  final int amountPage;
  final Function(int) onPageChanged;

  const PaginationWidget({
    super.key,
    required this.page,
    required this.amountPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: page > 1 ? () => onPageChanged(page - 1) : null,
        ),
        Text('$page / $amountPage', style: const TextStyle(fontSize: 16)),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: page < amountPage ? () => onPageChanged(page + 1) : null,
        ),
      ],
    );
  }
}