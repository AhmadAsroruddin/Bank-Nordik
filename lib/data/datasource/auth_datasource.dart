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
    var response = await dio.request('https://bwabank.my.id/api/register',
        options: Options(method: 'POST', headers: headers), data: data);

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
