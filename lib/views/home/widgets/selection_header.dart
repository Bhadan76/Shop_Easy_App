
import 'package:flutter/material.dart';

class SelectionHeader extends StatelessWidget {
  final String name;

  const SelectionHeader({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}