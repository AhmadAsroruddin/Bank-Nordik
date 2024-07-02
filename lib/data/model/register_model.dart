import 'package:equatable/equatable.dart';
import 'package:bank_nordik/domain/entities/auth_register.dart';

class RegisterModel extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  const RegisterModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      RegisterModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );

  AuthRegister toEntity() {
    return AuthRegister(
      name: name,
      email: email,
      ktp: ktp,
      password: password,
      pin: pin,
      profilePicture: profilePicture,
    );
  }

  factory RegisterModel.fromEntity(AuthRegister authRegister) {
    return RegisterModel(
      email: authRegister.email,
      ktp: authRegister.ktp,
      name: authRegister.name,
      password: authRegister.password,
      pin: authRegister.pin,
      profilePicture: authRegister.profilePicture,
    );
  }

  @override
  List<Object?> get props => [name, email, password, profilePicture, ktp, pin];
}
