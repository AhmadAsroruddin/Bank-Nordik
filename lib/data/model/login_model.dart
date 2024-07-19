import '../../domain/entities/user.dart';

class LoginModel {
  final int id;
  final String name;
  final String email;
  final String username;
  final bool emailVerified;
  final int verified;
  final String profilePicture;
  final String ktp;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int balance;
  final String cardNumber;
  final String pin;
  final String token;
  final int tokenExpiresIn;
  final String tokenType;
  final String password;

  LoginModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.emailVerified,
      required this.verified,
      required this.profilePicture,
      required this.ktp,
      required this.createdAt,
      required this.updatedAt,
      required this.balance,
      required this.cardNumber,
      required this.pin,
      required this.token,
      required this.tokenExpiresIn,
      required this.tokenType,
      required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        emailVerified: json['email_verified_at'] != null,
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        ktp: json['ktp'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
        tokenExpiresIn: json['token_expires_in'],
        tokenType: json['token_type'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'email_verified_at': emailVerified ? createdAt.toIso8601String() : null,
      'verified': verified,
      'profile_picture': profilePicture,
      'ktp': ktp,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'balance': balance,
      'card_number': cardNumber,
      'pin': pin,
      'token': token,
      'token_expires_in': tokenExpiresIn,
      'token_type': tokenType,
    };
  }

  User toEntity() {
    return User(
        id: id,
        name: name,
        email: email,
        username: username,
        emailVerified: emailVerified,
        verified: verified,
        profilePicture: profilePicture,
        ktp: ktp,
        createdAt: createdAt,
        updatedAt: updatedAt,
        balance: balance,
        cardNumber: cardNumber,
        pin: pin,
        token: token,
        tokenExpiresIn: tokenExpiresIn,
        tokenType: tokenType,
        password: password);
  }

  factory LoginModel.fromEntity(User user) {
    return LoginModel(
        id: user.id,
        name: user.name,
        email: user.email,
        username: user.username,
        emailVerified: user.emailVerified,
        verified: user.verified,
        profilePicture: user.profilePicture,
        ktp: user.ktp,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        balance: user.balance,
        cardNumber: user.cardNumber,
        pin: user.pin,
        token: user.token,
        tokenExpiresIn: user.tokenExpiresIn,
        tokenType: user.tokenType,
        password: user.password);
  }
}
