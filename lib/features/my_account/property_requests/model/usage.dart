class Usage {
  int? usageId;
  Null? sectionId;
  String? usageName;
  String? isTrash;
  String? status;
  String? dateAdded;
  String? lastUpdated;
  Null? image;
  Null? activeImage;
  int? priority;
  Null? slug;
  String? name;

  Usage(
      {this.usageId,
        this.sectionId,
        this.usageName,
        this.isTrash,
        this.status,
        this.dateAdded,
        this.lastUpdated,
        this.image,
        this.activeImage,
        this.priority,
        this.slug,
        this.name});

  Usage.fromJson(Map<String, dynamic> json) {
    usageId = json['usage_id'];
    sectionId = json['section_id'];
    usageName = json['usage_name'];
    isTrash = json['isTrash'];
    status = json['status'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
    image = json['image'];
    activeImage = json['active_image'];
    priority = json['priority'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usage_id'] = this.usageId;
    data['section_id'] = this.sectionId;
    data['usage_name'] = this.usageName;
    data['isTrash'] = this.isTrash;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    data['last_updated'] = this.lastUpdated;
    data['image'] = this.image;
    data['active_image'] = this.activeImage;
    data['priority'] = this.priority;
    data['slug'] = this.slug;
    data['name'] = this.name;
    return data;
  }
}
