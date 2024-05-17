class Images {
  int? id;
  int? adId;
  String? imageName;
  Null? priority;
  String? isTrash;
  String? status;

  Images(
      {this.id,
        this.adId,
        this.imageName,
        this.priority,
        this.isTrash,
        this.status});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adId = json['ad_id'];
    imageName = json['image_name'];
    priority = json['priority'];
    isTrash = json['isTrash'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ad_id'] = this.adId;
    data['image_name'] = this.imageName;
    data['priority'] = this.priority;
    data['isTrash'] = this.isTrash;
    data['status'] = this.status;
    return data;
  }
}
