import 'package:ecommerce_app/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_events.dart';
import 'package:ecommerce_app/features/product/bloc/product_view_bloc.dart';
import 'package:ecommerce_app/features/product/bloc/product_view_events.dart';
import 'package:ecommerce_app/features/product/bloc/product_view_states.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isFetched = false;
  late PageController _pageController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isFetched) {
      String id = ModalRoute.of(context)!.settings.arguments as String;
      context.read<ProductViewBloc>().add(ProductViewInitialEvent(id));
      isFetched = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<ProductViewBloc, ProductViewStates>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == ProductViewStatus.success
              ? Scaffold(
                  backgroundColor: Colors.white,
                  body: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        surfaceTintColor: AppColors.imageColor,
                        backgroundColor: AppColors.imageColor,
                        pinned: true,
                        expandedHeight: 350,
                        toolbarHeight: 60,
                        actionsPadding: EdgeInsets.only(right: 15),
                        leadingWidth: 80,

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
                        actions: [
                          Container(
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                        flexibleSpace: BlocBuilder<ProductViewBloc, ProductViewStates>(
                          buildWhen: (previous, current) =>
                              previous.pageIndex != current.pageIndex,
                          builder: (context, state) {
                            return FlexibleSpaceBar(
                              background: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 30,
                                    child: PageView.builder(
                                      controller: _pageController,
                                      onPageChanged: (value) {
                                        context.read<ProductViewBloc>().add(
                                          PageViewChange(value),
                                        );
                                      },
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Image.asset(
                                          "assets/images/onboarding1-Photoroom.png",
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 30,
                                    right: 30,
                                    child: Container(
                                      height: 80,
                                      width: 400,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: GridView.builder(
                                        scrollDirection: Axis.horizontal,
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 500,
                                            ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              context
                                                  .read<ProductViewBloc>()
                                                  .add(PageViewChange(index));
                                              _pageController.animateToPage(
                                                index, // The index of the thumbnail clicked
                                                duration: const Duration(
                                                  milliseconds: 1,
                                                ),
                                                curve: Curves.ease,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: index == state.pageIndex
                                                    ? AppColors
                                                          .backgroundFormColor
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              margin: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                "assets/images/onboarding1-Photoroom.png",
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SliverFillRemaining(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      state.productData!.category!["name"],
                                      style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.star, color: Colors.amberAccent),
                                    Text(
                                      "(5)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  state.productData!.name!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      "Weight : ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "1 kg",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 80,
                                  width: 450,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 300,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                        ),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        height: 50,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: index == 0
                                              ? AppColors.primaryColor
                                              : AppColors.imageColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "1kg",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: index == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "\$ ${state.productData!.price!}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: index == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: 10,
                                  ),
                                ),
                                Text(
                                  "Product Details",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                    left: 8,
                                  ),
                                  child: Text(
                                    state.productData!.description!,
                                    style: TextStyle(
                                      fontSize: 16,

                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //=====================================footer===================================== \\
                  persistentFooterButtons: [
                    state.status == ProductViewStatus.success
                        ? BlocBuilder<ProductViewBloc, ProductViewStates>(
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: AppColors.backgroundFormColor
                                                .withAlpha(150),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(50),
                                                      ),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<ProductViewBloc>()
                                                        .add(
                                                          OnDecrementQuantity(),
                                                        );
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${state.quantity}",
                                                textAlign: TextAlign.center,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(50),
                                                      ),
                                                ),
                                                child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  alignment: Alignment.center,
                                                  onPressed: () {
                                                    context
                                                        .read<ProductViewBloc>()
                                                        .add(
                                                          OnIncrementQuantity(),
                                                        );
                                                  },
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                          ),
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                              color: AppColors.primaryColor,
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                context.read<CartBloc>().add(
                                                  AddproductToCartEvent(
                                                    productId:
                                                        state.productData!.id!,
                                                    quantity: state.quantity!,
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "Add to cart",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Text(
                                                    "\$ ${state.productData!.price}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(),
                  ],
                  persistentFooterDecoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                )
              : Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
