import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class FloatingNavigationBar extends StatelessWidget {
  final int currentIndex;
  final dynamic Function(int) onTap;
  const FloatingNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            customBottomNavItem(0, Icons.home),
            customBottomNavItem(1, Icons.shopping_cart_outlined),
            customBottomNavItem(3, Icons.favorite_outline),
            customBottomNavItem(2, Icons.chat_bubble_outline),
            customBottomNavItem(4, Icons.person_outline),
          ],
        ),
      ),
    );
  }

  Widget customBottomNavItem(int curIndex, IconData icon) {
    bool isSelected = currentIndex == curIndex;
    return GestureDetector(
      onTap: () => onTap(curIndex),
      child: Container(
        padding: const EdgeInsets.all(19),
        // height: double.infinity,
        // width: 67,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondaryColor
              : AppColors.primaryColor.withAlpha(200),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}
