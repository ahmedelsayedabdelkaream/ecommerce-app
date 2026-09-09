import 'package:ecommerce_app/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

enum CartStatus { initial, loading, loadingTwo, success, error }

enum PaymentMethod { cash, card, wallet }

class CartStates extends Equatable {
  final CartStatus status;
  final PaymentMethod? paymentMethod;
  final String? message;
  final List<CartModel>? cartList;
  final double? totalPrice;
  final double? dis;
  final double? deliveryCharge;
  final double? serviceFee;
  final String? error;
  final double? totalAmount;
  const CartStates({
    this.status = CartStatus.initial,
    this.message = "",
    this.cartList,
    this.totalPrice,
    this.error = "",
    this.dis,
    this.deliveryCharge,
    this.serviceFee,
    this.totalAmount,
    this.paymentMethod = PaymentMethod.cash,
  });
  CartStates copyWith({
    CartStatus? status,
    String? message,
    List<CartModel>? cartList,
    double? totalPrice,
    double? dis,
    double? deliveryCharge,
    double? serviceFee,
    double? totalAmount,
    String? error,
    PaymentMethod? paymentMethod,
  }) {
    return CartStates(
      status: status ?? this.status,
      message: message ?? this.message,
      cartList: cartList ?? this.cartList,
      totalPrice: totalPrice ?? this.totalPrice,
      error: error ?? this.error,
      dis: dis ?? this.dis,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      serviceFee: serviceFee ?? this.serviceFee,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  List<Object> get props => [
    status,
    message ?? "",
    cartList ?? "",
    error ?? "",
    totalPrice ?? "",
    dis ?? "",
    deliveryCharge ?? "",
    serviceFee ?? "",
    totalAmount ?? "",
    paymentMethod ?? "",
  ];
}
