import 'package:ecommerce_app/data/models/category_model.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final void Function()? onTap;
  const CategoryCard({
    super.key,
    required this.isSelected,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.backgroundFormColor.withAlpha(100),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.secondaryColor
                        : AppColors.imageColor,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      category.image ?? '',
                      width: 30,
                      height: 30,

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  category.name ?? '',
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
