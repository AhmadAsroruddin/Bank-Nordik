import 'package:bank_nordik/data/model/check_email_model.dart';
import 'package:bank_nordik/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/login_model.dart';

abstract class AuthRepository {
  Future<Either<String, String>> register(User authRegister);
  Future<EmailStatusModel> emailCheck(String email);
  Future<Either<String, User>> login(String email, String password);
  Future<LoginModel?> getUserData();
}
