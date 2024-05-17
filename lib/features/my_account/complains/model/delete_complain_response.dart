import 'package:mafatih/features/my_account/complains/model/complaint.dart';

class DeleteComplainResponse {
  int? status;
  String? message;
  List<Complaints>? complaints;

  DeleteComplainResponse({this.status, this.message, this.complaints});

  DeleteComplainResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['complaints'] != null) {
      complaints = <Complaints>[];
      json['complaints'].forEach((v) {
        complaints!.add(Complaints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.complaints != null) {
      data['complaints'] = this.complaints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
