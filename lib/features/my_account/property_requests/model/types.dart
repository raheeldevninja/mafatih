import 'package:mafatih/features/my_account/property_requests/model/pivot.dart';

class Types {
  int? categoryId;
  Null? sectionId;
  String? categoryName;
  String? amenitiesRequired;
  String? slug;
  int? priority;
  String? isTrash;
  String? status;
  String? dateAdded;
  String? lastUpdated;
  String? icon;
  String? xmlInserted;
  Null? listingType;
  Null? image;
  Null? activeImage;
  String? searchKeyword;
  String? fType;
  String? hBd;
  String? hBth;
  String? hIn;
  String? hIsMor;
  String? hRights;
  String? hRFacade;
  String? hMayAffect;
  String? hDisputes;
  String? hExpiryDate;
  String? hLNo;
  String? hPlanNo;
  String? hNoOfU;
  String? hFloorNo;
  String? hUnitNo;
  String? hSellingPrice;
  String? hPLimits;
  String? hNumOfFloors;
  String? name;
  Pivot? pivot;

  Types(
      {this.categoryId,
        this.sectionId,
        this.categoryName,
        this.amenitiesRequired,
        this.slug,
        this.priority,
        this.isTrash,
        this.status,
        this.dateAdded,
        this.lastUpdated,
        this.icon,
        this.xmlInserted,
        this.listingType,
        this.image,
        this.activeImage,
        this.searchKeyword,
        this.fType,
        this.hBd,
        this.hBth,
        this.hIn,
        this.hIsMor,
        this.hRights,
        this.hRFacade,
        this.hMayAffect,
        this.hDisputes,
        this.hExpiryDate,
        this.hLNo,
        this.hPlanNo,
        this.hNoOfU,
        this.hFloorNo,
        this.hUnitNo,
        this.hSellingPrice,
        this.hPLimits,
        this.hNumOfFloors,
        this.name,
        this.pivot});

  Types.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    sectionId = json['section_id'];
    categoryName = json['category_name'];
    amenitiesRequired = json['amenities_required'];
    slug = json['slug'];
    priority = json['priority'];
    isTrash = json['isTrash'];
    status = json['status'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
    icon = json['icon'];
    xmlInserted = json['xml_inserted'];
    listingType = json['listing_type'];
    image = json['image'];
    activeImage = json['active_image'];
    searchKeyword = json['search_keyword'];
    fType = json['f_type'];
    hBd = json['h_bd'];
    hBth = json['h_bth'];
    hIn = json['h_in'];
    hIsMor = json['h_is_mor'];
    hRights = json['h_rights'];
    hRFacade = json['h_r_facade'];
    hMayAffect = json['h_may_affect'];
    hDisputes = json['h_disputes'];
    hExpiryDate = json['h_expiry_date'];
    hLNo = json['h_l_no'];
    hPlanNo = json['h_plan_no'];
    hNoOfU = json['h_no_of_u'];
    hFloorNo = json['h_floor_no'];
    hUnitNo = json['h_unit_no'];
    hSellingPrice = json['h_selling_price'];
    hPLimits = json['h_p_limits'];
    hNumOfFloors = json['h_num_of_floors'];
    name = json['name'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['section_id'] = this.sectionId;
    data['category_name'] = this.categoryName;
    data['amenities_required'] = this.amenitiesRequired;
    data['slug'] = this.slug;
    data['priority'] = this.priority;
    data['isTrash'] = this.isTrash;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    data['last_updated'] = this.lastUpdated;
    data['icon'] = this.icon;
    data['xml_inserted'] = this.xmlInserted;
    data['listing_type'] = this.listingType;
    data['image'] = this.image;
    data['active_image'] = this.activeImage;
    data['search_keyword'] = this.searchKeyword;
    data['f_type'] = this.fType;
    data['h_bd'] = this.hBd;
    data['h_bth'] = this.hBth;
    data['h_in'] = this.hIn;
    data['h_is_mor'] = this.hIsMor;
    data['h_rights'] = this.hRights;
    data['h_r_facade'] = this.hRFacade;
    data['h_may_affect'] = this.hMayAffect;
    data['h_disputes'] = this.hDisputes;
    data['h_expiry_date'] = this.hExpiryDate;
    data['h_l_no'] = this.hLNo;
    data['h_plan_no'] = this.hPlanNo;
    data['h_no_of_u'] = this.hNoOfU;
    data['h_floor_no'] = this.hFloorNo;
    data['h_unit_no'] = this.hUnitNo;
    data['h_selling_price'] = this.hSellingPrice;
    data['h_p_limits'] = this.hPLimits;
    data['h_num_of_floors'] = this.hNumOfFloors;
    data['name'] = this.name;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}