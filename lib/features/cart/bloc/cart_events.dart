import 'package:ecommerce_app/features/cart/bloc/cart_states.dart';

abstract class CartEvents {}

class GetCartEvent extends CartEvents {}

class AddproductToCartEvent extends CartEvents {
  final String productId;
  final int quantity;
  AddproductToCartEvent({required this.productId, required this.quantity});
}

class PaymentChangeEvent extends CartEvents {
  final PaymentMethod paymentMethod;
  PaymentChangeEvent({required this.paymentMethod});
}

class AddToCartEvent extends CartEvents {
  final String productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCartEvent extends CartEvents {
  final String productId;

  RemoveFromCartEvent({required this.productId});
}
