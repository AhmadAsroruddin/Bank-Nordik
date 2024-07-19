import 'package:bank_nordik/data/model/register_model.dart';
import 'package:bank_nordik/domain/usecase/auth/emailCheck_usecase.dart';
import 'package:bank_nordik/domain/usecase/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._registerUsecase, this._emailCheckUseCase)
      : super(RegistrationInitial());

  final RegisterUsecase _registerUsecase;
  final EmailCheckUseCase _emailCheckUseCase;

  void submitRegisterData(String fullName, String email, String password) {
    emit(
      RegistrationData(
        registerModel: RegisterModel(
          username: fullName,
          email: email,
          password: password,
        ),
      ),
    );
  }

  void submitRegisterDataWithPhoto(String fullName, String email,
      String password, String photo, String pin) {
    emit(
      RegistrationData(
        registerModel: RegisterModel(
          username: fullName,
          email: email,
          password: password,
          pin: pin,
          profilePicture: photo,
        ),
      ),
    );
  }

  void submitRegisterDataFull(String fullName, String email, String password,
      String photo, String ktp, String pin) async {
    final result = await _registerUsecase.execute(RegisterModel(
            username: fullName,
            email: email,
            password: password,
            profilePicture: photo,
            ktp: ktp,
            pin: pin)
        .toEntity());

    result.fold(
        (l) => {
              emit(RegistrationFailed(error: l)),
            },
        (r) => {
              emit(RegistrationDone(text: r)),
            });
  }

  Future<void> emailCheck(String email) async {
    final response = await _emailCheckUseCase.execute(email);

    if (response.isEmailExist) {
      emit(EmailNotValid());
    } else {
      emit(EmailValid());
    }
  }
}
