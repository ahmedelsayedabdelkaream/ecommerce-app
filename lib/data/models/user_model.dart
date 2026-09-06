import 'dart:io';

import 'package:dio/dio.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? address;
  final String? gender;
  final File? image;
  final String? role;
  final String? createdAt;
  final String? updatedAt;
  final FormData? avatar;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.address,
    this.gender,
    this.image,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
      gender: json['gender'],
      image: json['image'],
      role: json['role'],
      avatar: json['avatar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'gender': gender,
      'image': image,
      'role': role,
      'avatar': avatar,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class AuthModel {
  final String? userId;
  final String? message;
  final String? accessToken;
  final String? refreshToken;
  final String? otp;

  AuthModel({
    this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.message,
    this.otp,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userId: json['userId'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      message: json['message'],
      otp: json['otp'],
    );
  }
}
