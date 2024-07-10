class EmailStatusModel {
  const EmailStatusModel({required this.isEmailExist});

  final bool isEmailExist;
  factory EmailStatusModel.fromJson(Map<String, dynamic> json) {
    return EmailStatusModel(
      isEmailExist: json['is_email_exist'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_email_exist': isEmailExist,
    };
  }
}
