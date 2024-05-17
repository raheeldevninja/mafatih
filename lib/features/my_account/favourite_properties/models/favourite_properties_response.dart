import 'package:mafatih/core/models/property.dart';

class FavouritePropertiesResponse {
  int? status;
  String? message;
  List<Properties>? properties;

  FavouritePropertiesResponse({this.status, this.message, this.properties});

  FavouritePropertiesResponse.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  int? adId;
  int? userId;
  Property? property;

  Properties({this.id, this.adId, this.userId, this.property});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adId = json['ad_id'];
    userId = json['user_id'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ad_id'] = this.adId;
    data['user_id'] = this.userId;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    return data;
  }
}

