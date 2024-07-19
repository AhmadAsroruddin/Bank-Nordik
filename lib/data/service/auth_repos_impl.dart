import 'package:bank_nordik/data/datasource/auth_datasource.dart';
import 'package:bank_nordik/data/model/check_email_model.dart';
import 'package:bank_nordik/data/model/login_model.dart';
import 'package:bank_nordik/data/model/register_model.dart';
import 'package:bank_nordik/domain/entities/user.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterReposImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  RegisterReposImpl({required this.authDatasource});

  @override
  Future<Either<String, String>> register(User authRegister) async {
    try {
      await authDatasource.register(RegisterModel.fromEntity(authRegister));
      return const Right("Registration Successfully");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<EmailStatusModel> emailCheck(String email) async {
    return await authDatasource.emailCheck(email);
  }

  @override
  Future<Either<String, User>> login(String email, String password) async {
    try {
      LoginModel result = await authDatasource.login(email, password);
      final entity = result.toEntity();

      return Right(entity);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
