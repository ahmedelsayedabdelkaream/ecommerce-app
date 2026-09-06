import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/category_model.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/data/services/api_service.dart';

class ProductRepository {
  final ApiService apiService;
  const ProductRepository(this.apiService);
  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await apiService.get('products/viewProducts');
      List<ProductModel> products = List<ProductModel>.from(
        response.data["products"].map((x) => ProductModel.fromJson(x)),
      );
      return products;
    } on DioException catch (e) {
      String message = "something went wrong";
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        message = "connection timeout please check your internet";
      } else if (e.type == DioExceptionType.connectionError) {
        message = "No internet connection";
      } else if (e.response != null) {
        message = e.response?.data['message'] ?? message;
      }
      throw message;
    }
  }

  Future<List<ProductModel>> getProductsByCategory(String id) async {
    try {
      Response response = await apiService.get(
        'products/viewProductsByCategory/$id',
      );
      List<ProductModel> products = List<ProductModel>.from(
        response.data["products"].map((x) => ProductModel.fromJson(x)),
      );
      return products;
    } on DioException catch (e) {
      String message = "something went wrong";
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        message = "connection timeout please check your internet";
      } else if (e.type == DioExceptionType.connectionError) {
        message = "No internet connection";
      } else if (e.response != null) {
        message = e.response?.data['message'] ?? message;
      }
      throw message;
    }
  }

  Future<ProductModel> getSingleProducts(String id) async {
    try {
      Response response = await apiService.get(
        'products/viewSingleProduct/$id',
      );
      ProductModel product = ProductModel.fromJson(response.data["product"]);
      return product;
    } on DioException catch (e) {
      String message = "something went wrong";
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        message = "connection timeout please check your internet";
      } else if (e.type == DioExceptionType.connectionError) {
        message = "No internet connection";
      } else if (e.response != null) {
        message = e.response?.data['message'] ?? message;
      }
      throw message;
    }
  }

  Future<List<CategoryModel>> getCategory() async {
    try {
      Response response = await apiService.get('products/viewCategories');
      List<CategoryModel> category = List<CategoryModel>.from(
        response.data["categories"].map((x) => CategoryModel.fromJson(x)),
      );
      return category;
    } on DioException catch (e) {
      String message = "something went wrong";
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        message = "connection timeout please check your internet";
      } else if (e.type == DioExceptionType.connectionError) {
        message = "No internet connection";
      } else if (e.response != null) {
        message = e.response?.data['message'] ?? message;
      }
      throw message;
    }
  }
}
