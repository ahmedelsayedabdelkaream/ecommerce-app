import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/user_model.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio;
  final StorageServices storageServices;

  ApiService(this.storageServices)
    : _dio = Dio(
        BaseOptions(
          // Use 10.0.2.2 for Android Emulator, localhost for iOS Simulator
          baseUrl: 'http://10.0.2.2:8080/',
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'ngrok-skip-browser-warning': 'true',
          },
        ),
      ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('Bearer ${storageServices.getAccessToken}');
          }
          // You can add logic here to attach tokens from SharedPreferences
          options.headers['Authorization'] =
              'Bearer ${storageServices.getAccessToken}';
          if (kDebugMode) {
            print('REQUEST[${options.method}] => PATH: ${options.path}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print(
              'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
            );
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (kDebugMode) {
            print(
              'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
            );
          }
          if (e.response?.statusCode == 401) {
            await refreshAccessToken();
            e.requestOptions.headers['Authorization'] =
                'Bearer ${storageServices.getAccessToken}';
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }

  // GET Method
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST Method
  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PATCH Method
  Future<Response> patch(String path, {dynamic data}) async {
    try {
      final response = await _dio.patch(path, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE Method
  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> refreshAccessToken() async {
    try {
      final response = await post(
        'auth/refreshAccessToken',
        data: {"refreshToken": storageServices.getRefreshToken},
      );
      final AuthModel data = AuthModel.fromJson(response.data);
      await storageServices.setAccessToken(data.accessToken!);
      return response;
    } on DioException catch (e) {
      String message = "something went wrong";
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        message = "connection timeout please check your internet";
      } else if (e.type == DioExceptionType.connectionError) {
        message = "No internet connection";
      } else if (e.response != null) {
        message = e.response?.data['message'] ?? "Error";
      }
      throw message;
    }
  }
}
