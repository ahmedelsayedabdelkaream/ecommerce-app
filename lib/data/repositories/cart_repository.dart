import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/cart_model.dart';
import 'package:ecommerce_app/data/services/api_service.dart';

class CartRepository {
  ApiService api;
  CartRepository(this.api);
  Future<String> addToCart(String productId, int quantity) async {
    try {
      final response = await api.post(
        'cart/addToCart',
        data: {'productId': productId, 'quantity': quantity},
      );
      return response.data["message"];
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

  Future<List<CartModel>> getCart() async {
    try {
      final response = await api.get('cart/getCart');
      List<CartModel> cart = List<CartModel>.from(
        response.data["cart"].map((x) => CartModel.fromJson(x)),
      );
      return cart;
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

  Future<List<CartModel>> incrementCartItem(String productId) async {
    try {
      final response = await api.post(
        'cart/incrementCartItem',
        data: {'productId': productId},
      );
      List<CartModel> cart = List<CartModel>.from(
        response.data["cart"].map((x) => CartModel.fromJson(x)),
      );
      return cart;
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
