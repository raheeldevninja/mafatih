import 'package:mafatih/features/agencies/model/staff_data.dart';

class Staff {
  List<StaffData>? data;

  Staff({this.data});

  Staff.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StaffData>[];
      json['data'].forEach((v) {
        data!.add(new StaffData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}