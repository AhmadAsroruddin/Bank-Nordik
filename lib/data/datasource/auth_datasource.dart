import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/register_model.dart';

abstract class AuthDatasource {
  Future<void> register(RegisterModel registerModel);
}

class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<void> register(RegisterModel registerModel) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode(registerModel);

    var dio = Dio();

    var response = await dio.request(
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

    if (response.statusCode == 200) {
      print('Response data: ${json.encode(response.data)}');
    } else {
      print('Error: ${response.statusMessage}');
      print(
          'Error data: ${json.encode(response.data)}'); // Tambahkan ini untuk melihat detail kesalahan
    }
  }
}
