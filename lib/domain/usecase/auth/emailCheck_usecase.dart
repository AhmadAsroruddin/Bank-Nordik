import 'package:bank_nordik/data/model/check_email_model.dart';
import 'package:bank_nordik/domain/repositories/auth_repository.dart';

class EmailCheckUseCase {
  final AuthRepository authRepository;

  EmailCheckUseCase({required this.authRepository});

  Future<EmailStatusModel> execute(String email) {
    return authRepository.emailCheck(email);
  }
}
