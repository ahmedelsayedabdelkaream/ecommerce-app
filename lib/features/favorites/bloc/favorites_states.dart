import 'package:ecommerce_app/data/models/category_model.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

enum FavoritesStatus { initial, loading, success, error }

class FavoriteStates extends Equatable {
  final FavoritesStatus status;
  final int? categoryIndex;
  final Set<CategoryModel>? category;
  final Set<String>? favoritesIds;
  final List<ProductModel>? products;
  final String? errorMessage;
  const FavoriteStates({
    this.status = FavoritesStatus.initial,
    this.categoryIndex,
    this.category,
    this.products,
    this.errorMessage,
    this.favoritesIds = const {},
  });
  FavoriteStates copyWith({
    FavoritesStatus? status,
    int? categoryIndex,
    Set<String>? favoritesIds,
    Set<CategoryModel>? category,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return FavoriteStates(
      status: status ?? this.status,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      category: category ?? this.category,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      favoritesIds: favoritesIds ?? this.favoritesIds,
    );
  }

  @override
  List<Object?> get props => [
    status,
    categoryIndex,
    category,
    products,
    favoritesIds,
    errorMessage,
  ];
}
