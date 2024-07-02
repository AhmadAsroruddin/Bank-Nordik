import 'package:bank_nordik/domain/entities/auth_register.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, AuthRegister>> register(AuthRegister authRegister);
}
