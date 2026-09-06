import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.imageColor,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 190,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  height: 150,
                  "assets/images/onboarding1-Photoroom2.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor.withAlpha(100),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text("  Exclusive Offer  "),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Daily ",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),

                          TextSpan(
                            text: "Grocery Offers",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Up to ",
                          style: TextStyle(
                            color: AppColors.primaryColor.withAlpha(200),
                            fontSize: 20,
                          ),
                        ),
                        Stack(
                          children: [
                            Text(
                              "25",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 13,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  color: Colors.white,
                                  Icons.percent,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: Size(40, 35),
                      ),
                      onPressed: () {},
                      child: Text(
                        "shop now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
