// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';
import 'dart:core';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? email;
  final String? username;
  final String? userId;
  final String? documentId;
  final String? uniqueUserId;
  final String? token;
  final String? refreshToken;
  final String? photoUrl;
  final String? phoneNumber;
  final String? password;
  bool? showOnBoarding = false;
  UserModel({
    this.email,
    this.username,
    this.userId,
    this.documentId,
    this.uniqueUserId,
    this.token,
    this.refreshToken,
    this.photoUrl,
    this.phoneNumber,
    this.password,
    this.showOnBoarding,
  });

  UserModel copyWith({
    String? email,
    String? username,
    String? userId,
    String? documentId,
    String? uniqueUserId,
    String? token,
    String? refreshToken,
    String? photoUrl,
    String? phoneNumber,
    String? password,
    bool? showOnBoarding,
  }) {
    return UserModel(
      email: email ?? this.email,
      username: username ?? this.username,
      userId: userId ?? this.userId,
      documentId: documentId ?? this.documentId,
      uniqueUserId: uniqueUserId ?? this.uniqueUserId,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      showOnBoarding: showOnBoarding ?? this.showOnBoarding,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'userId': userId,
      'documentId': documentId,
      'uniqueUserId': uniqueUserId,
      'token': token,
      'refreshToken': refreshToken,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'password': password,
      'showOnBoarding': showOnBoarding,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      documentId:
          map['documentId'] != null ? map['documentId'] as String : null,
      uniqueUserId:
          map['uniqueUserId'] != null ? map['uniqueUserId'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      showOnBoarding:
          map['showOnBoarding'] != null ? map['showOnBoarding'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      email,
      username,
      userId,
      documentId,
      uniqueUserId,
      token,
      refreshToken,
      photoUrl,
      phoneNumber,
      password,
      showOnBoarding,
    ];
  }
}
