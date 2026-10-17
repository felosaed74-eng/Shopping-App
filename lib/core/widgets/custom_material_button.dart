import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/app_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      padding: EdgeInsets.all(10),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge
            ?.copyWith(color: AppColors.white),
      ),
    );
  }
}
