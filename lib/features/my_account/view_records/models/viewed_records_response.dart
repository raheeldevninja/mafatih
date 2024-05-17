import 'package:mafatih/core/models/property.dart';

class ViewedRecordsResponse {
  int? status;
  String? message;
  List<Properties>? properties;

  ViewedRecordsResponse({this.status, this.message, this.properties});

  ViewedRecordsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  int? id;
  Property? property;

  Properties({this.id, this.property});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    return data;
  }
}