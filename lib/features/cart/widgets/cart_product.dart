import 'package:ecommerce_app/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_events.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_states.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProduct extends StatelessWidget {
  final CartStates state;
  final int index;
  const CartProduct({super.key, required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(50),
              blurRadius: 3,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.black26,
                      child: Image.network(
                        state.cartList![index].image ?? '',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.cartList![index].name ?? ''),
                    Text("${state.cartList![index].quantity! * 0.5} kg"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "${state.cartList![index].price! * state.cartList![index].quantity!} \$",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundFormColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  style: ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                      EdgeInsets.zero,
                                    ),
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(30, 30),
                                    ),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                          Colors.white,
                                        ),
                                  ),
                                  icon: Icon(
                                    size: 18,
                                    Icons.remove,
                                    color: AppColors.primaryColor,
                                  ),
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      RemoveFromCartEvent(
                                        productId: state.cartList![index].id!,
                                      ),
                                    );
                                  },
                                  color: Colors.white,
                                ),
                                Text("${state.cartList![index].quantity!}"),
                                IconButton(
                                  style: ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                      EdgeInsets.all(5),
                                    ),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    minimumSize: WidgetStatePropertyAll(
                                      Size(30, 30),
                                    ),
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                          AppColors.primaryColor,
                                        ),
                                  ),
                                  icon: Icon(size: 22, Icons.add),
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                      AddToCartEvent(
                                        productId: state.cartList![index].id!,
                                      ),
                                    );
                                  },
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
