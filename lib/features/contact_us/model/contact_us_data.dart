class ContactUsData {

  final String fullName;
  final String email;
  final String phone;
  final String message;

  const ContactUsData({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.message,
  });

  ContactUsData copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? message,
  }) {
    return ContactUsData(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'phone': phone,
      'message': message,
    };
  }

}