class ProfileData {

  final String? fullName;
  final String? email;
  final String? password;
  final String? confirmPassword;

  ProfileData({this.fullName, this.email, this.password, this.confirmPassword});

  ProfileData.fromJson(Map<String, dynamic> json)
    : fullName = json['full_name'],
      email = json['email'],
      password = json['password'],
      confirmPassword = json['password_confirmation'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    if (this.password != null) data['password'] = this.password;
    if (this.confirmPassword != null) data['password_confirmation'] = this.confirmPassword;
    return data;
  }

  ProfileData copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return ProfileData(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  String toString() {
    return 'ProfileData{full_name: $fullName, email: $email, password: $password, password_confirmation: $confirmPassword}';
  }




}
