import 'package:bank_nordik/data/datasource/auth_datasource.dart';
import 'package:bank_nordik/data/model/check_email_model.dart';
import 'package:bank_nordik/data/model/register_model.dart';
import 'package:bank_nordik/domain/entities/auth_register.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterReposImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  RegisterReposImpl({required this.authDatasource});

  @override
  Future<Either<String, AuthRegister>> register(
      AuthRegister authRegister) async {
    try {
      await authDatasource.register(RegisterModel.fromEntity(authRegister));
      return Right(authRegister);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<EmailStatusModel> emailCheck(String email) async {
    return await authDatasource.emailCheck(email);
  }
}
