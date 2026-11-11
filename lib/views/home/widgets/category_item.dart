import 'package:flutter/material.dart';
import 'package:shop_easy/app/app_colors.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: AppColors.background,
              ),
            ),
          ),
         SizedBox(height: 8),
          Text(
            'Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}