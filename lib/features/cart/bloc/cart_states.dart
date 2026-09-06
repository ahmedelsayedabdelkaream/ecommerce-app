import 'package:ecommerce_app/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

enum CartStatus { initial, loading, loadingTwo, success, error }

class CartStates extends Equatable {
  final CartStatus status;
  final String? message;
  final List<CartModel>? cartList;
  final String? error;
  const CartStates({
    this.status = CartStatus.initial,
    this.message = "",
    this.cartList,
    this.error = "",
  });
  CartStates copyWith({
    CartStatus? status,
    String? message,
    List<CartModel>? cartList,
    String? error,
  }) {
    return CartStates(
      status: status ?? this.status,
      message: message ?? this.message,
      cartList: cartList ?? this.cartList,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
    status,
    message ?? "",
    cartList ?? "",
    error ?? "",
  ];
}
