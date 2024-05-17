import 'package:mafatih/features/agencies/model/staff.dart';

class AgencyData {
  int? userId;
  String? companyFullName;
  String? phone;
  String? email;
  String? slug;
  String? nationalId;
  String? statusTitle;
  String? verified;
  String? image;
  Staff? staff;

  AgencyData(
      {this.userId,
        this.companyFullName,
        this.phone,
        this.email,
        this.slug,
        this.nationalId,
        this.statusTitle,
        this.verified,
        this.image,
        this.staff});

  AgencyData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyFullName = json['company_full_name'];
    phone = json['phone'];
    email = json['email'];
    slug = json['slug'];
    nationalId = json['national_id'];
    statusTitle = json['status_title'];
    verified = json['verified'];
    image = json['image'];
    staff = json['staff'] != null ? new Staff.fromJson(json['staff']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['company_full_name'] = this.companyFullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['slug'] = this.slug;
    data['national_id'] = this.nationalId;
    data['status_title'] = this.statusTitle;
    data['verified'] = this.verified;
    data['image'] = this.image;
    if (this.staff != null) {
      data['staff'] = this.staff!.toJson();
    }
    return data;
  }
}