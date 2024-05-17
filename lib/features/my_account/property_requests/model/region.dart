class Region {
  int? regionId;
  String? name;
  String? lastUpdated;
  String? status;
  int? priority;
  int? countryId;
  String? slug;
  String? tname;

  Region(
      {this.regionId,
        this.name,
        this.lastUpdated,
        this.status,
        this.priority,
        this.countryId,
        this.slug,
        this.tname});

  Region.fromJson(Map<String, dynamic> json) {
    regionId = json['region_id'];
    name = json['name'];
    lastUpdated = json['last_updated'];
    status = json['status'];
    priority = json['priority'];
    countryId = json['country_id'];
    slug = json['slug'];
    tname = json['tname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_id'] = this.regionId;
    data['name'] = this.name;
    data['last_updated'] = this.lastUpdated;
    data['status'] = this.status;
    data['priority'] = this.priority;
    data['country_id'] = this.countryId;
    data['slug'] = this.slug;
    data['tname'] = this.tname;
    return data;
  }
}