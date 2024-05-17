import 'package:mafatih/features/my_account/property_requests/model/region.dart';
import 'package:mafatih/features/my_account/property_requests/model/types.dart';
import 'package:mafatih/features/my_account/property_requests/model/usage.dart';
import 'package:mafatih/features/my_account/property_requests/model/visitor.dart';

class PropertyRequestsProperties {
  int? id;
  String? uid;
  int? sectionId;
  int? rent;
  String? type;
  int? regionId;
  int? cityId;
  Null? districtId;
  Null? neighborhoodCategoryId;
  Null? neighborhoodId;
  String? areaFrom;
  String? areaTo;
  String? numRoomsFrom;
  String? numRoomsTo;
  String? priceFrom;
  String? priceTo;
  String? details;
  int? agree;
  int? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  int? status;
  int? categoryId;
  String? userUpdated;
  String? dateAdded;
  int? isTrash;
  Null? createdAt;
  Null? updatedAt;
  Null? deletedAt;
  String? typestext;
  String? districttext;
  String? statustext;
  int? statisviewcount;
  int? statisemailcount;
  int? statiswhatsappcount;
  int? statisphonecount;
  Region? region;
  Visitor? visitor;
  Null? neighborhood;
  Null? city;
  Usage? usage;
  List<Types>? types;
  //List<Null>? district;

  PropertyRequestsProperties(
      {this.id,
        this.uid,
        this.sectionId,
        this.rent,
        this.type,
        this.regionId,
        this.cityId,
        this.districtId,
        this.neighborhoodCategoryId,
        this.neighborhoodId,
        this.areaFrom,
        this.areaTo,
        this.numRoomsFrom,
        this.numRoomsTo,
        this.priceFrom,
        this.priceTo,
        this.details,
        this.agree,
        this.userId,
        this.userName,
        this.userEmail,
        this.userPhone,
        this.status,
        this.categoryId,
        this.userUpdated,
        this.dateAdded,
        this.isTrash,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.typestext,
        this.districttext,
        this.statustext,
        this.statisviewcount,
        this.statisemailcount,
        this.statiswhatsappcount,
        this.statisphonecount,
        this.region,
        this.visitor,
        this.neighborhood,
        this.city,
        this.usage,
        this.types,
        //this.district
      });

  PropertyRequestsProperties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    sectionId = json['section_id'];
    rent = json['rent'];
    type = json['type'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    neighborhoodCategoryId = json['neighborhood_category_id'];
    neighborhoodId = json['neighborhood_id'];
    areaFrom = json['area_from'];
    areaTo = json['area_to'];
    numRoomsFrom = json['num_rooms_from'];
    numRoomsTo = json['num_rooms_to'];
    priceFrom = json['price_from'];
    priceTo = json['price_to'];
    details = json['details'];
    agree = json['agree'];
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    status = json['status'];
    categoryId = json['category_id'];
    userUpdated = json['user_updated'];
    dateAdded = json['date_added'];
    isTrash = json['isTrash'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    typestext = json['typestext'];
    districttext = json['districttext'];
    statustext = json['statustext'];
    statisviewcount = json['statisviewcount'];
    statisemailcount = json['statisemailcount'];
    statiswhatsappcount = json['statiswhatsappcount'];
    statisphonecount = json['statisphonecount'];
    region =
    json['region'] != null ? new Region.fromJson(json['region']) : null;
    visitor =
    json['visitor'] != null ? new Visitor.fromJson(json['visitor']) : null;
    neighborhood = json['neighborhood'];
    city = json['city'];
    usage = json['usage'] != null ? new Usage.fromJson(json['usage']) : null;
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    /*if (json['district'] != null) {
      district = <Null>[];
      json['district'].forEach((v) {
        district!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['section_id'] = this.sectionId;
    data['rent'] = this.rent;
    data['type'] = this.type;
    data['region_id'] = this.regionId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['neighborhood_category_id'] = this.neighborhoodCategoryId;
    data['neighborhood_id'] = this.neighborhoodId;
    data['area_from'] = this.areaFrom;
    data['area_to'] = this.areaTo;
    data['num_rooms_from'] = this.numRoomsFrom;
    data['num_rooms_to'] = this.numRoomsTo;
    data['price_from'] = this.priceFrom;
    data['price_to'] = this.priceTo;
    data['details'] = this.details;
    data['agree'] = this.agree;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['user_updated'] = this.userUpdated;
    data['date_added'] = this.dateAdded;
    data['isTrash'] = this.isTrash;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['typestext'] = this.typestext;
    data['districttext'] = this.districttext;
    data['statustext'] = this.statustext;
    data['statisviewcount'] = this.statisviewcount;
    data['statisemailcount'] = this.statisemailcount;
    data['statiswhatsappcount'] = this.statiswhatsappcount;
    data['statisphonecount'] = this.statisphonecount;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.visitor != null) {
      data['visitor'] = this.visitor!.toJson();
    }
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    /*if (this.district != null) {
      data['district'] = this.district!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}
