import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

enum ProductViewStatus { initial, error, loading, success }

class ProductViewStates extends Equatable {
  final ProductViewStatus status;
  final ProductModel? productData;
  final int? pageIndex;
  final int? quantity;
  const ProductViewStates({
    this.status = ProductViewStatus.initial,
    this.quantity = 1,
    this.productData,
    this.pageIndex = 0,
  });

  ProductViewStates copyWith({
    ProductViewStatus? status,
    ProductModel? productData,
    int? quantity,
    int? pageIndex,
  }) {
    return ProductViewStates(
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      productData: productData ?? this.productData,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object?> get props => [status, productData, quantity, pageIndex];
}
