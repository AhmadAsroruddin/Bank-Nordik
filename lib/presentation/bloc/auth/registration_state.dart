part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class EmailValid extends RegistrationState {}

class EmailNotValid extends RegistrationState {}

class RegistrationData extends RegistrationState {
  final RegisterModel registerModel;

  const RegistrationData({required this.registerModel});

  @override
  List<Object> get props => [registerModel];
}
