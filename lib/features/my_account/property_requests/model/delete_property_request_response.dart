import 'package:mafatih/features/my_account/property_requests/model/property_requests_property.dart';

class DeletePropertyRequestResponse {
  int? status;
  String? message;
  List<PropertyRequestsProperties>? properties;

  DeletePropertyRequestResponse({this.status, this.message, this.properties});

  DeletePropertyRequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['properties'] != null) {
      properties = <PropertyRequestsProperties>[];
      json['properties'].forEach((v) {
        properties!.add(new PropertyRequestsProperties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
