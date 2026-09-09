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

  Future<Map<String, dynamic>> getCart() async {
    try {
      final response = await api.get('cart/getCart');
      List<CartModel> cart = List<CartModel>.from(
        response.data['cart'].map((x) => CartModel.fromJson(x)),
      );
      final double totalPrice =
          (response.data['billDetail']['cartTotal'] as num).toDouble();
      final double discound = (response.data['billDetail']['discount'] as num)
          .toDouble();
      final double deliveryCharge =
          (response.data['billDetail']['deliveryCharge'] as num).toDouble();
      final double serviceFee =
          (response.data['billDetail']['serviceFee'] as num).toDouble();
      final totalAmount = (response.data['billDetail']['total'] as num)
          .toDouble();

      return {
        "cart": cart,
        "totalPrice": totalPrice,
        "discound": discound,
        "deliveryCharge": deliveryCharge,
        "serviceFee": serviceFee,
        "totalAmount": totalAmount,
      };
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

  Future<Map<String, dynamic>> incrementCartItem(String productId) async {
    try {
      final response = await api.post(
        'cart/incrementCartItem',
        data: {'productId': productId},
      );
      List<CartModel> cart = List<CartModel>.from(
        response.data["cart"].map((x) => CartModel.fromJson(x)),
      );
      final double totalPrice =
          (response.data['billDetail']['cartTotal'] as num).toDouble();
      final double discound = (response.data['billDetail']['discount'] as num)
          .toDouble();
      final double deliveryCharge =
          (response.data['billDetail']['deliveryCharge'] as num).toDouble();
      final double serviceFee =
          (response.data['billDetail']['serviceFee'] as num).toDouble();
      final totalAmount = (response.data['billDetail']['total'] as num)
          .toDouble();

      return {
        "cart": cart,
        "totalPrice": totalPrice,
        "discound": discound,
        "deliveryCharge": deliveryCharge,
        "serviceFee": serviceFee,
        "totalAmount": totalAmount,
      };
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

  Future<Map<String, dynamic>> decrementCartItem(String productId) async {
    try {
      final response = await api.post(
        'cart/decrementCartItem',
        data: {'productId': productId},
      );
      List<CartModel> cart = List<CartModel>.from(
        response.data["cart"].map((x) => CartModel.fromJson(x)),
      );
      final double totalPrice =
          (response.data['billDetail']['cartTotal'] as num).toDouble();
      final double discound = (response.data['billDetail']['discount'] as num)
          .toDouble();
      final double deliveryCharge =
          (response.data['billDetail']['deliveryCharge'] as num).toDouble();
      final double serviceFee =
          (response.data['billDetail']['serviceFee'] as num).toDouble();
      final totalAmount = (response.data['billDetail']['total'] as num)
          .toDouble();

      return {
        "cart": cart,
        "totalPrice": totalPrice,
        "discound": discound,
        "deliveryCharge": deliveryCharge,
        "serviceFee": serviceFee,
        "totalAmount": totalAmount,
      };
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
