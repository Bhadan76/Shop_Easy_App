

import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String name;
  final Color color;
  const SelectionButton({
    super.key, required this.name,required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 10,
            color: color,
          ),
        ],
      ),
    );
  }
}