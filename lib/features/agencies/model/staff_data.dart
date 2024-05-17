class StaffData {
  int? userId;
  String? fullName;
  String? phone;
  String? email;
  String? slug;
  String? nationalId;
  String? statusTitle;
  String? verified;
  String? image;

  StaffData(
      {this.userId,
        this.fullName,
        this.phone,
        this.email,
        this.slug,
        this.nationalId,
        this.statusTitle,
        this.verified,
        this.image});

  StaffData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    slug = json['slug'];
    nationalId = json['national_id'];
    statusTitle = json['status_title'];
    verified = json['verified'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['slug'] = this.slug;
    data['national_id'] = this.nationalId;
    data['status_title'] = this.statusTitle;
    data['verified'] = this.verified;
    data['image'] = this.image;
    return data;
  }
}

