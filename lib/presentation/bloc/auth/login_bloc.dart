import 'package:bank_nordik/data/model/login_model.dart';
import 'package:bank_nordik/domain/usecase/auth/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  final LoginUsecase loginUsecase;

  Future<void> login(String email, String password) async {
    final result = await loginUsecase.execute(email, password);

    result.fold(
      (l) => emit(LoginFailed(error: l)),
      (r) => emit(LoginSuccess(loginModel: LoginModel.fromEntity(r))),
    );
  }
}
