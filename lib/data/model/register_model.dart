import '../../domain/entities/user.dart';

class RegisterModel {
  final String? email;
  final String? username;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  RegisterModel({
    this.email,
    this.username,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      username: json['username'],
      password: json['password'],
      pin: json['pin'],
      profilePicture: json['profile_picture'],
      ktp: json['ktp'],
    );
  }

  factory RegisterModel.fromEntity(User entity) {
    return RegisterModel(
      email: entity.email,
      username: entity.username,
      profilePicture: entity.profilePicture,
      ktp: entity.ktp,
      pin: entity.pin,
      password: entity.password,
    );
  }

  User toEntity() {
    return User(
        id: 0,
        name: username!,
        email: email!,
        username: email!,
        emailVerified: false,
        verified: 0,
        profilePicture: profilePicture!,
        ktp: ktp!,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        balance: 0,
        cardNumber: '',
        pin: pin!,
        token: '',
        tokenExpiresIn: 0,
        tokenType: '',
        password: password!);
  }
}
