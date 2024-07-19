class User {
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

  User({
    required this.password,
    required this.id,
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
  });
}
