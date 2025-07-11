import 'package:dio/dio.dart';
import 'package:flutter_ecom/app/constants/constant.dart';

class APIProvider {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrlAndroid,
      contentType: 'application/json',
      responseType: ResponseType.json,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  //Sing Up
  Future<Response> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return await dio.post(
        "/register",
        data: {'name': name, 'email': email, 'password': password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  //Sign In
  Future<Response> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await dio.post(
        "/login",
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
