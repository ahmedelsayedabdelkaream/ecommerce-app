import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/user_model.dart';
import 'package:ecommerce_app/data/services/api_service.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';

class AuthRepository {
  ApiService api;
  StorageServices storageServices;
  AuthRepository(this.api, this.storageServices);
  Future<AuthModel> login(String email, String password) async {
    try {
      final response = await api.post(
        'auth/login',
        data: {'email': email, 'password': password},
      );
      final AuthModel data = AuthModel.fromJson(response.data);

      storageServices.setAccessToken(data.accessToken!);
      storageServices.setRefreshToken(data.refreshToken!);
      return data;
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

  Future<void> logout() async {
    // await storageServices.removeAccessToken();
    // await storageServices.removeRefreshToken();
  }

  Future<AuthModel> register(String email, String password) async {
    try {
      final response = await api.post(
        'auth/register',
        data: {'email': email, 'password': password},
      );
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
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

  Future<AuthModel> completeProfile(UserModel userModel) async {
    Map<String, dynamic> data = userModel.toJson();
    data["avatar"] = await MultipartFile.fromFile(
      userModel.image!.path,
      filename: "profile_pic.jpg",
    );
    data.remove("image");
    FormData formData = FormData.fromMap(data);
    try {
      final response = await api.post('auth/completeProfile', data: formData);
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
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

  Future<AuthModel> sendOTP(String email, String purpose) async {
    try {
      final response = await api.post(
        'auth/sendOTP',
        data: {'email': email, "purpose": "resetPassword"},
      );
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
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

  Future<AuthModel> vreifyEmailOTP(String email, String otp) async {
    try {
      final response = await api.post(
        'auth/verifyEmailOTP',
        data: {'email': email, "otp": otp},
      );
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
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

  Future<AuthModel> vreifyResetPasswordOTP(String email, String otp) async {
    try {
      final response = await api.post(
        'auth/verifyResetPasswordOTP',
        data: {'email': email, "otp": otp},
      );
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
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

  Future<AuthModel> resetPassword(String password, String otp) async {
    try {
      final response = await api.post(
        'auth/resetPassword',
        data: {'password': password, "otp": otp},
      );
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
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
