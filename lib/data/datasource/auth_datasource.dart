import 'dart:convert';

import 'package:bank_nordik/data/model/check_email_model.dart';
import 'package:bank_nordik/data/model/login_model.dart';
import 'package:dio/dio.dart';

import '../model/register_model.dart';

abstract class AuthDatasource {
  Future<void> register(RegisterModel registerModel);
  Future<EmailStatusModel> emailCheck(String email);
  Future<LoginModel> login(String email, String password);
}

class AuthDatasourceImpl extends AuthDatasource {
  var dio = Dio();
  var headers = {'Content-Type': 'application/json'};

  @override
  Future<void> register(RegisterModel registerModel) async {
    var data = json.encode(registerModel);

    await dio.request(
      'https://bwabank.my.id/api/register',
      options: Options(
        method: 'POST',
        headers: headers,
        validateStatus: (status) {
          return status! < 500; // Izinkan status kode di bawah 500
        },
      ),
      data: data,
    );
  }

  @override
  Future<EmailStatusModel> emailCheck(String email) async {
    try {
      var data = json.encode({"email": email});
      var response = await dio.post(
        'https://bwabank.my.id/api/is-email-exist',
        options: Options(
          headers: headers, // Define your headers here if needed
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        return EmailStatusModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to check email existence');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Future<LoginModel> login(String email, String password) async {
    var data = json.encode({"email": email, "password": password});

    var response = await dio.post(
      'https://bwabank.my.id/api/login',
      options: Options(headers: headers),
      data: data,
    );

    return LoginModel.fromJson(response.data);
  }
}
