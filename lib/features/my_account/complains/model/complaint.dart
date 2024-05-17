import 'package:mafatih/core/models/property.dart';

class Complaints {
  int? id;
  int? userId;
  int? adId;
  String? dateAdded;
  String? status;
  int? masterId;
  String? comment;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? reply;
  String? type;
  String? date;
  String? statusTitle;
  String? time;
  Property? property;

  Complaints(
      {this.id,
        this.userId,
        this.adId,
        this.dateAdded,
        this.status,
        this.masterId,
        this.comment,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.reply,
        this.type,
        this.date,
        this.statusTitle,
        this.time,
        this.property});

  Complaints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    adId = json['ad_id'];
    dateAdded = json['date_added'];
    status = json['status'];
    masterId = json['master_id'];
    comment = json['comment'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reply = json['reply'];
    type = json['type'];
    date = json['date'];
    statusTitle = json['status_title'];
    time = json['time'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ad_id'] = this.adId;
    data['date_added'] = this.dateAdded;
    data['status'] = this.status;
    data['master_id'] = this.masterId;
    data['comment'] = this.comment;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reply'] = this.reply;
    data['type'] = this.type;
    data['date'] = this.date;
    data['status_title'] = this.statusTitle;
    data['time'] = this.time;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    return data;
  }
}
