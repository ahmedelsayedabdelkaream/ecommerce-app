import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/models/cart_model.dart';
import 'package:ecommerce_app/data/repositories/cart_repository.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_events.dart';
import 'package:ecommerce_app/features/cart/bloc/cart_states.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  CartRepository cartRepository;
  CartBloc(this.cartRepository) : super(CartStates()) {
    on<AddproductToCartEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CartStatus.loading));
        String message = await cartRepository.addToCart(
          event.productId,
          event.quantity,
        );
        emit(state.copyWith(message: message, status: CartStatus.success));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });
    on<AddToCartEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CartStatus.loadingTwo));
        final cart = await cartRepository.incrementCartItem(event.productId);
        emit(state.copyWith(cartList: cart, status: CartStatus.success));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });
    on<RemoveToCartEvent>((event, emit) async {
      try {
        final cart = await cartRepository.incrementCartItem(event.productId);
        emit(state.copyWith(cartList: cart));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });

    on<GetCartEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: CartStatus.loading));
        List<CartModel> cart = await cartRepository.getCart();
        emit(state.copyWith(cartList: cart, status: CartStatus.success));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      }
    });
  }
}
