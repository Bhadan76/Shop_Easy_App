import 'package:flutter/material.dart';
import 'package:shop_easy/app/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          // Product Image
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300',
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(width: 6),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // Product Name
                Text(
                  'Smart Watch Pro',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                // Product Price
                Wrap(
                  spacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                     Text(
                      '৳2,999',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      '৳4,999',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                // Discount Badge
                Container(
                  height: 20,
                  width: 60,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.productOfferButton,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(
                    '40% OFF',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.productOffer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}