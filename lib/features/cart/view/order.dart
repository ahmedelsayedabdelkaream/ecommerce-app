import 'package:ecommerce_app/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_events.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_states.dart';
import 'package:ecommerce_app/features/cart/widgets/bill_summary.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<CartBloc, CartStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("Order")),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "LOS ANGELES",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "123, MAIN ST APT 4B",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Mobile No: 1234567890",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.directions_bike,
                            color: AppColors.primaryColor,
                          ),
                          title: Text(
                            "Delivery",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text("Arriving in 10 - 15 minutes"),
                        ),
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: RadioGroup(
                          groupValue: state.paymentMethod,
                          onChanged: (val) {
                            context.read<CartBloc>().add(
                              PaymentChangeEvent(paymentMethod: val!),
                            );
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.money,
                                  color: AppColors.primaryColor,
                                ),
                                title: Text("Cash On Delivery"),
                                trailing: Radio(value: PaymentMethod.cash),
                              ),
                              Divider(
                                color: Colors.grey[300],
                                indent: 20,
                                endIndent: 20,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.credit_card,
                                  color: AppColors.primaryColor,
                                ),
                                title: Text("Add Card"),
                                trailing: Radio(value: PaymentMethod.card),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextFormField(
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.compress_outlined),
                            hint: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "coupon code",
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                            suffixIcon: TextButton(
                              onPressed: () {},
                              child: Text(
                                "submit",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    sliver: SliverToBoxAdapter(
                      child: BillSummary(state: state),
                    ),
                  ),
                ],
              ),
            ),
            persistentFooterButtons: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<CartBloc, CartStates>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: AppColors.primaryColor,
                          ),
                          child: state.status == CartStatus.loadingTwo
                              ? Center(
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Place Order",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
          );
        },
      ),
    );
  }
}
