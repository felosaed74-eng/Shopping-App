import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/app_colors.dart';

class ProductedItemWidget extends StatelessWidget {
  const ProductedItemWidget({
    super.key,
    required this.onTap,
    this.favoriteOnTap,
    required this.title,
    required this.discount,
    required this.price,
    required this.rating,
    required this.image,
  });
  final Widget? favoriteOnTap;
  final String title;
  final double discount;
  final double price;
  final double rating;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.orangeLight),
        ),
      ),
    );
  }
}
