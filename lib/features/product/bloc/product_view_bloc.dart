import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/features/product/bloc/product_view_events.dart';
import 'package:ecommerce_app/features/product/bloc/product_view_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewBloc extends Bloc<ProductViewEvents, ProductViewStates> {
  ProductRepository api;
  ProductViewBloc(this.api) : super(ProductViewStates()) {
    on<ProductViewInitialEvent>((event, emit) async {
      emit(state.copyWith(status: ProductViewStatus.loading));
      final ProductModel product = await api.getSingleProducts(event.productId);
      emit(
        state.copyWith(status: ProductViewStatus.success, productData: product),
      );
    });
    on<PageViewChange>((event, emit) async {
      emit(state.copyWith(pageIndex: event.index));
    });
    on<OnIncrementQuantity>((event, emit) async {
      emit(state.copyWith(quantity: state.quantity! + 1));
    });
    on<OnDecrementQuantity>((event, emit) async {
      if (state.quantity! <= 1) {
        emit(state.copyWith(quantity: 1));
        return;
      }
      emit(state.copyWith(quantity: state.quantity! - 1));
    });
  }
}
