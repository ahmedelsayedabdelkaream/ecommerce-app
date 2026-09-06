import 'package:ecommerce_app/features/home/bloc/home_page_bloc.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_state.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialOfferList extends StatefulWidget {
  const SpecialOfferList({super.key});

  @override
  State<SpecialOfferList> createState() => _SpecialOfferListState();
}

class _SpecialOfferListState extends State<SpecialOfferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        centerTitle: true,
        title: const Text("Special Offers"),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) {
          return state.status == HomePageStatus.loading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: ListView.builder(
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryColor
                                              .withAlpha(100),
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Up to ",
                                            style: TextStyle(
                                              color: AppColors.primaryColor
                                                  .withAlpha(200),
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
                                                    color: AppColors
                                                        .secondaryColor,
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
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
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
                    },
                  ),
                );
        },
      ),
    );
  }
}
