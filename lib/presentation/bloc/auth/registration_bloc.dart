import 'package:bank_nordik/data/model/register_model.dart';
import 'package:bank_nordik/domain/entities/auth_register.dart';
import 'package:bank_nordik/domain/usecase/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this._registerUsecase) : super(RegistrationInitial());

  final RegisterUsecase _registerUsecase;

  void submitRegisterData(String fullName, String email, String password) {
    emit(
      RegistrationData(
        registerModel: RegisterModel(
          name: fullName,
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
          name: fullName,
          email: email,
          password: password,
          pin: pin,
          profilePicture: photo,
        ),
      ),
    );
  }

  void submitRegisterDataFull(String fullName, String email, String password,
      String photo, String ktp, String pin) {
    _registerUsecase.execute(AuthRegister(
        name: fullName,
        email: email,
        password: password,
        profilePicture: photo,
        ktp: ktp,
        pin: pin));
    emit(
      RegistrationData(
        registerModel: RegisterModel(
            name: fullName,
            email: email,
            password: password,
            pin: pin,
            profilePicture: photo,
            ktp: ktp),
      ),
    );
  }
}
