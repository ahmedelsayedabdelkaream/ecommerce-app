import 'package:ecommerce_app/features/home/bloc/home_page_bloc.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_events.dart';
import 'package:ecommerce_app/features/home/bloc/home_page_state.dart';
import 'package:ecommerce_app/features/home/widgets/category_card.dart';
import 'package:ecommerce_app/features/home/widgets/explore_more.dart';
import 'package:ecommerce_app/features/home/widgets/lower_sliver.dart';
import 'package:ecommerce_app/features/home/widgets/offer.dart';
import 'package:ecommerce_app/features/home/widgets/product_card.dart';
import 'package:ecommerce_app/features/home/widgets/upper_sliver.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(OnInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageBloc, HomePageStates>(
        builder: (context, state) {
          return state.status == HomePageStatus.loading
              ? Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    // ======================TOP APPBAR===================== \\
                    UpperSliverBar(),
                    // ======================BOTTOM APPBAR===================== \\
                    LowerSliverBar(),
                    // ======================CONTENT===================== \\
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(20),
                        child: Column(
                          children: [
                            TextRow(
                              text1: "Special offer",
                              text2: "See all",
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/specialOffersList',
                                );
                              },
                            ),
                            Container(
                              width: double.infinity,
                              height: 210,
                              decoration: BoxDecoration(
                                // color: AppColors.imageColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(30),
                                child: PageView.builder(
                                  itemCount: 3,
                                  onPageChanged: (value) {
                                    context.read<HomePageBloc>().add(
                                      OnPageViewChanged(value),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return OfferCard();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            BlocBuilder<HomePageBloc, HomePageStates>(
                              builder: (context, state) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 7,
                                  children: List.generate(3, (index) {
                                    return Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        color: index == state.pageIndex
                                            ? AppColors.secondaryColor
                                            : AppColors.secondaryColor
                                                  .withAlpha(50),
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            TextRow(
                              text1: "Explore Categories",
                              text2: "See all",
                              onPressed: () {
                                Navigator.pushNamed(context, '/categoriesList');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: BlocBuilder<HomePageBloc, HomePageStates>(
                            builder: (context, state) {
                              return ListView.builder(
                                itemCount: state.categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoryCard(
                                    index: index,
                                    state: state,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextRow(
                          text1: "Featured Products",
                          text2: "See all",
                          onPressed: () {},
                        ),
                      ),
                    ),
                    BlocBuilder<HomePageBloc, HomePageStates>(
                      builder: (context, state) {
                        return SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          sliver: state.status == HomePageStatus.productsLoading
                              ? SliverToBoxAdapter(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : SliverGrid(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                      ),
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) =>
                                        ProductCard(state: state, index: index),
                                    childCount: state.featuredProducts.length,
                                  ),
                                ),
                        );
                      },
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                );
        },
      ),
    );
  }
}
