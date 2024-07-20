import 'package:bank_nordik/domain/repositories/auth_repository.dart';

import '../../../data/model/login_model.dart';

class GetUserDataUsecase {
  final AuthRepository authRepository;

  GetUserDataUsecase({required this.authRepository});

  Future<LoginModel?> execute() async {
    return authRepository.getUserData();
  }
}
