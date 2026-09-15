import 'package:ecommerce_app/features/cart/bloc/cart_states.dart';
import 'package:ecommerce_app/shared/themes/colors.dart';
import 'package:flutter/widgets.dart';

class BillSummary extends StatelessWidget {
  final CartStates state;
  const BillSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment summary",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            const Text(
              "Cart total",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              "\$ ${state.totalPrice}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Dioscount",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              "- \$ ${state.dis}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Delivery fee",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              "\$ ${state.deliveryCharge}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Service fee",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              "\$ ${state.serviceFee}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            const Text(
              "Total amount",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              "\$ ${state.totalAmount}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
