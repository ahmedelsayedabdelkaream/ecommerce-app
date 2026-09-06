import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class UpperSliverBar extends StatelessWidget {
  const UpperSliverBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: AppColors.primaryColor,
      floating: true,
      expandedHeight: 60,
      collapsedHeight: 60,
      toolbarHeight: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 49, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(50),
              child: Image.asset(
                cacheHeight: 130,
                cacheWidth: 131,
                "assets/images/onboarding1.png",
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 5),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.location_on_rounded, color: Colors.white),
                    Text(
                      "Dhaka",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.all(0),
              highlightColor: Colors.transparent,
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white, // Green
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.notifications_none, color: Colors.black),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
