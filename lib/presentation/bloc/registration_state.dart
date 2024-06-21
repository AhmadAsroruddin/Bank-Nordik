part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationData extends RegistrationState {
  final String fullName;
  final String email;
  final String password;
  final String? token;

  const RegistrationData({
    required this.fullName,
    required this.email,
    required this.password,
    this.token,
  });

  @override
  List<Object?> get props => [fullName, email, password, token];
}
