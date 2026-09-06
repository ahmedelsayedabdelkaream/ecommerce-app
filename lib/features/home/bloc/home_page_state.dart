import 'package:ecommerce_app/data/models/category_model.dart';
import 'package:ecommerce_app/data/models/product_model.dart';

enum HomePageStatus { initial, error, loading, productsLoading, success }

class HomePageStates {
  final HomePageStatus status;
  final List<CategoryModel> categories;
  final List<ProductModel> featuredProducts;
  final int pageIndex;
  final int? categoryIndex;

  const HomePageStates({
    this.status = HomePageStatus.initial,
    required this.pageIndex,
    this.categoryIndex,
    required this.categories,
    required this.featuredProducts,
  });

  HomePageStates copyWith({
    HomePageStatus? status,
    int? pageIndex,
    int? categoryIndex,
    List<CategoryModel>? categories,
    List<ProductModel>? featuredProducts,
  }) => HomePageStates(
    status: status ?? this.status,
    pageIndex: pageIndex ?? this.pageIndex,
    categoryIndex: categoryIndex ?? this.categoryIndex,
    categories: categories ?? this.categories,
    featuredProducts: featuredProducts ?? this.featuredProducts,
  );
}
