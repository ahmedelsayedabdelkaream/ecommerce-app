import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class LowerSliverBar extends StatelessWidget {
  const LowerSliverBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyActions: false,
      automaticallyImplyLeading: false,

      surfaceTintColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      expandedHeight: 0,
      collapsedHeight: 0,
      toolbarHeight: 0,
      backgroundColor: AppColors.primaryColor,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size(70, 70),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SizedBox(
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(right: 30, left: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                    ),
                  ),
                  child: TextFormField(
                    onTap: () => Navigator.pushNamed(context, '/search'),
                    readOnly: true,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search here...",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  child: Container(
                    height: 60,
                    width: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor, // Green
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      icon: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.tune),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
