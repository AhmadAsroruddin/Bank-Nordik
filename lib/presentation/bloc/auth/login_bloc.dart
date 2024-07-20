import 'dart:convert';

import 'package:bank_nordik/data/model/login_model.dart';
import 'package:bank_nordik/domain/usecase/auth/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUsecase) : super(LoginInitial());

  final LoginUsecase _loginUsecase;

  Future<void> login(String email, String password) async {
    final result = await _loginUsecase.execute(email, password);

    result.fold(
      (l) => emit(LoginFailed(error: l)),
      (r) async {
        final loginModel = LoginModel.fromEntity(r);

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('userData', jsonEncode(loginModel.toJson()));
        emit(LoginSuccess(loginModel: LoginModel.fromEntity(r)));
      },
    );
  }
}
