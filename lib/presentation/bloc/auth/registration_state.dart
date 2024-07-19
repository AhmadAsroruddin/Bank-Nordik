part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class EmailValid extends RegistrationState {}

class EmailNotValid extends RegistrationState {}

class RegistrationDone extends RegistrationState {
  final String text;

  const RegistrationDone({required this.text});
  @override
  List<Object> get props => [text];
}

class RegistrationFailed extends RegistrationState {
  final String error;

  const RegistrationFailed({required this.error});
  @override
  List<Object> get props => [error];
}

class RegistrationData extends RegistrationState {
  final RegisterModel registerModel;

  const RegistrationData({required this.registerModel});

  @override
  List<Object> get props => [registerModel];
}
