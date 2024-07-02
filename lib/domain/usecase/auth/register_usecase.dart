import 'package:bank_nordik/domain/entities/auth_register.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<Either<String, AuthRegister>> execute(AuthRegister authRegister) {
    return authRepository.register(authRegister);
  }
}
