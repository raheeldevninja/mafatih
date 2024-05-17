import 'package:mafatih/features/agencies/model/agencies_and_pagination.dart';

class AgenciesResponse {
  int? status;
  String? message;
  AgenciesAndPagination? agenciesAndPagination;

  AgenciesResponse({this.status, this.message, this.agenciesAndPagination});

  AgenciesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    agenciesAndPagination = json['data'] != null ? new AgenciesAndPagination.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.agenciesAndPagination != null) {
      data['data'] = this.agenciesAndPagination!.toJson();
    }
    return data;
  }
}


