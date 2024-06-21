import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  void submitRegisterData(String fullName, String email, String password) {
    emit(
        RegistrationData(fullName: fullName, email: email, password: password));
  }
}
