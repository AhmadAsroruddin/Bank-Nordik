import 'package:bank_nordik/domain/entities/user.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  Future<Either<String, User>> execute(String email, String password) {
    return authRepository.login(email, password);
  }
}
