part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});

  @override
  List<Object> get props => [error];
}
