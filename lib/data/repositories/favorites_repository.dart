import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/data/services/api_service.dart';

class FavoritesRepository {
  ApiService api;
  FavoritesRepository(this.api);

  Future<List<String>> getFavoritesId() async {
    try {
      final response = await api.get('favorites/whishListIds');
      List<String> ids = List<String>.from(response.data['wishList']);
      print(ids);
      return ids;
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

  Future<List<ProductModel>> getFavorites() async {
    try {
      final response = await api.get('favorites/full');
      List<ProductModel> products = List<ProductModel>.from(
        response.data["wishList"].map((x) => ProductModel.fromJson(x)),
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

  Future<void> addedToFavorite(String productId) async {
    try {
      await api.post('favorites/addToWishList/$productId');
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

  Future<void> removeFromFavorite(String productId) async {
    try {
      await api.post('favorites/removeFromWishList/$productId');
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
