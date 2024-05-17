class DeletePropertyResponse {
  int? status;
  String? message;

  DeletePropertyResponse({this.status, this.message});

  DeletePropertyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

    return data;
  }
}

class Properties {
  int? id;
  int? adId;
  int? userId;

  Properties({this.id, this.adId, this.userId});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adId = json['ad_id'];
    userId = json['user_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ad_id'] = this.adId;
    data['user_id'] = this.userId;

    return data;
  }
}

