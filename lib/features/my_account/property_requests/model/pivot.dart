class Pivot {
  int? requestId;
  int? categoriesId;

  Pivot({this.requestId, this.categoriesId});

  Pivot.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    categoriesId = json['categories_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['categories_id'] = this.categoriesId;
    return data;
  }
}