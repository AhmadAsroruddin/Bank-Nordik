import 'package:bank_nordik/domain/usecase/auth/getUserdata_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/login_model.dart';

class UserBloc extends Cubit<bool> {
  final GetUserDataUsecase getUserDataUsecase;

  UserBloc({required this.getUserDataUsecase}) : super(false);

  Future<LoginModel?> getUserData() {
    final result = getUserDataUsecase.execute();

    return result;
  }
}
