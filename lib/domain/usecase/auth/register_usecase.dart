import 'package:bank_nordik/domain/entities/user.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<Either<String, String>> execute(User authRegister) {
    return authRepository.register(authRegister);
  }
}
