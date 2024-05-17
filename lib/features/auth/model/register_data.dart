class RegisterData {

  final String fullName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isTermsAccepted;

  RegisterData({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.isTermsAccepted,
  });

  RegisterData.fromJson(Map<String, dynamic> json) :
    fullName = json['full_name'],
    phone = json['phone'],
    email = json['email'],
    password = json['password'],
    confirmPassword = json['password_confirmation'],
    isTermsAccepted = json['agree'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.confirmPassword;
    data['agree'] = this.isTermsAccepted;
    return data;
  }

  //to string
  @override
  String toString() {
    return 'RegisterData{fullName: $fullName, phone: $phone, email: $email, password: $password, confirmPassword: $confirmPassword, isTermsAccepted: $isTermsAccepted}';
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'phone': phone,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'agree': isTermsAccepted,
    };
  }

}