import 'package:mafatih/core/models/images.dart';

class Property {
  int? id;
  String? uid;
  int? sectionId;
  int? listingType;
  int? categoryId;
  Null? subCategoryId;
  String? adTitle;
  String? adDescription;
  String? price;
  String? pOR;
  Null? priceTo;
  Null? priceToFalse;
  Null? priceFalse;
  Null? fromPriceUnit;
  Null? toPriceUnit;
  int? areaUnit;
  int? model;
  int? country;
  int? region;
  int? state;
  Null? city;
  String? neighborhood;
  int? neighborhoodId;
  Null? district;
  String? addressInfo;
  String? mobileNumber;
  int? bathrooms;
  int? bedrooms;
  int? balconies;
  int? userId;
  String? dateAdded;
  String? lastUpdated;
  Null? priority;
  String? isTrash;
  String? status;
  String? slug;
  String? image;
  //Null? dynamic;
  String? locationLatitude;
  String? locationLongitude;
  String? featured;
  String? areaLocation;
  String? xmlInserted;
  String? code;
  String? refNo;
  Null? communityId;
  int? subCommunityId;
  String? propertyName;
  int? builtupArea;
  Null? plotArea;
  String? primaryUnitView;
  String? floorNo;
  Null? totalFloor;
  Null? handoverDate;
  String? parking;
  String? salesmanEmail;
  String? expiryDate;
  String? mandate;
  String? currencyAbr;
  String? areaMeasurement;
  int? retUnitCategory;
  String? recommendedProperties;
  int? propertyID;
  String? reraStrNo;
  int? rent;
  int? rentPerMonth;
  String? occupantStatus;
  String? rentPaid;
  String? nearestMetro;
  String? nearestRailway;
  Null? constructionStatus;
  Null? furnished;
  Null? maidRoom;
  Null? reraNo;
  Null? yearBuilt;
  Null? transactionType;
  Null? metaTitle;
  Null? metaDescription;
  String? wFor;
  Null? recmnded;
  Null? superHot;
  Null? hot;
  Null? contactPerson;
  String? landline;
  Null? video;
  String? insertVia;
  Null? slugZ;
  String? verified;
  Null? site;
  Null? nSendAt;
  Null? extendedOn;
  String? featuredE;
  String? fED;
  String? fStatus;
  String? view360;
  String? clientRef;
  String? propertyStatus;
  String? viewVideo;
  String? viewFloor;
  Null? interiorSize;
  int? areaUnit1;
  String? cronFeatured;
  String? cronExpiry;
  String? cronImages;
  String? cronUpdated;
  String? cronSimage;
  Null? cronArabic;
  String? userUpdated;
  String? slugEn;
  String? slugAr;
  String? slugCronUpdated;
  Null? metaTitleAr;
  Null? metaDescriptionAr;
  Null? packageUsed;
  String? pId;
  Null? pUrl;
  String? isMor;
  String? detailsIsMor;
  String? rights;
  String? detailsRights;
  String? mayAffect;
  String? rFacade;
  String? disputes;
  String? lNo;
  String? planNo;
  Null? noOfU;

  String? unitNo;
  Null? sellingPrice;
  String? cDate;
  String? pLimits;
  String? aCharaAr;
  String? length;
  String? width;
  String? totalArea;
  String? authNumber;
  String? streetWidth;
  String? detailsMayAffect;
  String? numOfFloors;
  Null? propManUnitId;
  int? score;
  String? regaAdvertiserId;
  String? regaAdvertisingLicenseNumber;
  String? regaDeedNumber;
  String? regaAdvertiserName;
  String? regaEstateBrokerage;
  String? regaAdditionalFigure;
  String? regaRestriction;
  String? regaWarranties;
  Null? regaCompliance;
  String? regaBuildingNumber;
  Null? regaAdvertisingChannelsN;
  Null? regaRealEstateServices;
  String? regaStartDateLicense;
  String? regaExpiryDateLicense;
  String? regaQrCodeLink;
  String? regaPostalCode;
  String? regaResponse;
  String? tinyurl;
  Null? regaIsHalted;
  Null? regaIsTestment;
  Null? regaRerConstraints;
  Null? regaLandTotalPrice;
  Null? regaLandTotalAnnualRent;
  Null? regaLandNumber;
  Null? regaAdLicenseURL;
  Null? regaAdSource;
  Null? regaTitleDeedTypeName;
  Null? regaLocationDescriptionOnMOJDeed;
  Null? regaNotes;
  Null? regaBorders;
  Null? regaRerBorders;
  Null? regaChannels;
  Null? regaPropertyUtilities;
  Null? regaRegion;
  Null? regaRegionCode;
  Null? regaPhoneNumber;
  Null? regaQrImage;
  String? url;
  String? statename;
  List<Images>? images;
  Null? staterel;
  Null? neighborhoodRel;
  Null? stateRel;

  Property(
      {this.id,
        this.uid,
        this.sectionId,
        this.listingType,
        this.categoryId,
        this.subCategoryId,
        this.adTitle,
        this.adDescription,
        this.price,
        this.pOR,
        this.priceTo,
        this.priceToFalse,
        this.priceFalse,
        this.fromPriceUnit,
        this.toPriceUnit,
        this.areaUnit,
        this.model,
        this.country,
        this.region,
        this.state,
        this.city,
        this.neighborhood,
        this.neighborhoodId,
        this.district,
        this.addressInfo,
        this.mobileNumber,
        this.bathrooms,
        this.bedrooms,
        this.balconies,
        this.userId,
        this.dateAdded,
        this.lastUpdated,
        this.priority,
        this.isTrash,
        this.status,
        this.slug,
        this.image,
        //this.dynamic,
        this.locationLatitude,
        this.locationLongitude,
        this.featured,
        this.areaLocation,
        this.xmlInserted,
        this.code,
        this.refNo,
        this.communityId,
        this.subCommunityId,
        this.propertyName,
        this.builtupArea,
        this.plotArea,
        this.primaryUnitView,
        this.floorNo,
        this.totalFloor,
        this.handoverDate,
        this.parking,
        this.salesmanEmail,
        this.expiryDate,
        this.mandate,
        this.currencyAbr,
        this.areaMeasurement,
        this.retUnitCategory,
        this.recommendedProperties,
        this.propertyID,
        this.reraStrNo,
        this.rent,
        this.rentPerMonth,
        this.occupantStatus,
        this.rentPaid,
        this.nearestMetro,
        this.nearestRailway,
        this.constructionStatus,
        this.furnished,
        this.maidRoom,
        this.reraNo,
        this.yearBuilt,
        this.transactionType,
        this.metaTitle,
        this.metaDescription,
        this.wFor,
        this.recmnded,
        this.superHot,
        this.hot,
        this.contactPerson,
        this.landline,
        this.video,
        this.insertVia,
        this.slugZ,
        this.verified,
        this.site,
        this.nSendAt,
        this.extendedOn,
        this.featuredE,
        this.fED,
        this.fStatus,
        this.view360,
        this.clientRef,
        this.propertyStatus,
        this.viewVideo,
        this.viewFloor,
        this.interiorSize,
        this.areaUnit1,
        this.cronFeatured,
        this.cronExpiry,
        this.cronImages,
        this.cronUpdated,
        this.cronSimage,
        this.cronArabic,
        this.userUpdated,
        this.slugEn,
        this.slugAr,
        this.slugCronUpdated,
        this.metaTitleAr,
        this.metaDescriptionAr,
        this.packageUsed,
        this.pId,
        this.pUrl,
        this.isMor,
        this.detailsIsMor,
        this.rights,
        this.detailsRights,
        this.mayAffect,
        this.rFacade,
        this.disputes,
        this.lNo,
        this.planNo,
        this.noOfU,
        this.unitNo,
        this.sellingPrice,
        this.cDate,
        this.pLimits,
        this.aCharaAr,
        this.length,
        this.width,
        this.totalArea,
        this.authNumber,
        this.streetWidth,
        this.detailsMayAffect,
        this.numOfFloors,
        this.propManUnitId,
        this.score,
        this.regaAdvertiserId,
        this.regaAdvertisingLicenseNumber,
        this.regaDeedNumber,
        this.regaAdvertiserName,
        this.regaEstateBrokerage,
        this.regaAdditionalFigure,
        this.regaRestriction,
        this.regaWarranties,
        this.regaCompliance,
        this.regaBuildingNumber,
        this.regaAdvertisingChannelsN,
        this.regaRealEstateServices,
        this.regaStartDateLicense,
        this.regaExpiryDateLicense,
        this.regaQrCodeLink,
        this.regaPostalCode,
        this.regaResponse,
        this.tinyurl,
        this.regaIsHalted,
        this.regaIsTestment,
        this.regaRerConstraints,
        this.regaLandTotalPrice,
        this.regaLandTotalAnnualRent,
        this.regaLandNumber,
        this.regaAdLicenseURL,
        this.regaAdSource,
        this.regaTitleDeedTypeName,
        this.regaLocationDescriptionOnMOJDeed,
        this.regaNotes,
        this.regaBorders,
        this.regaRerBorders,
        this.regaChannels,
        this.regaPropertyUtilities,
        this.regaRegion,
        this.regaRegionCode,
        this.regaPhoneNumber,
        this.regaQrImage,
        this.url,
        this.statename,
        this.images,
        this.staterel,
        this.neighborhoodRel,
        this.stateRel});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    sectionId = json['section_id'];
    listingType = json['listing_type'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    adTitle = json['ad_title'];
    adDescription = json['ad_description'];
    price = json['price'];
    pOR = json['p_o_r'];
    priceTo = json['price_to'];
    priceToFalse = json['price_to_false'];
    priceFalse = json['price_false'];
    fromPriceUnit = json['from_price_unit'];
    toPriceUnit = json['to_price_unit'];
    areaUnit = json['area_unit'];
    model = json['model'];
    country = json['country'];
    region = json['region'];
    state = json['state'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    neighborhoodId = json['neighborhood_id'];
    district = json['district'];
    addressInfo = json['address_info'];
    mobileNumber = json['mobile_number'];
    bathrooms = json['bathrooms'];
    bedrooms = json['bedrooms'];
    balconies = json['balconies'];
    userId = json['user_id'];
    dateAdded = json['date_added'];
    lastUpdated = json['last_updated'];
    priority = json['priority'];
    isTrash = json['isTrash'];
    status = json['status'];
    slug = json['slug'];
    image = json['image'];
    //dynamic = json['dynamic'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
    featured = json['featured'];
    areaLocation = json['area_location'];
    xmlInserted = json['xml_inserted'];
    code = json['code'];
    refNo = json['RefNo'];
    communityId = json['community_id'];
    subCommunityId = json['sub_community_id'];
    propertyName = json['property_name'];
    builtupArea = json['builtup_area'];
    plotArea = json['plot_area'];
    primaryUnitView = json['PrimaryUnitView'];
    totalFloor = json['total_floor'];
    handoverDate = json['HandoverDate'];
    parking = json['parking'];
    salesmanEmail = json['salesman_email'];
    expiryDate = json['expiry_date'];
    mandate = json['mandate'];
    currencyAbr = json['currency_abr'];
    areaMeasurement = json['area_measurement'];
    retUnitCategory = json['RetUnitCategory'];
    recommendedProperties = json['RecommendedProperties'];
    propertyID = json['PropertyID'];
    reraStrNo = json['ReraStrNo'];
    rent = json['Rent'];
    rentPerMonth = json['RentPerMonth'];
    occupantStatus = json['occupant_status'];
    rentPaid = json['rent_paid'];
    nearestMetro = json['nearest_metro'];
    nearestRailway = json['nearest_railway'];
    constructionStatus = json['construction_status'];
    furnished = json['furnished'];
    maidRoom = json['maid_room'];
    reraNo = json['rera_no'];
    yearBuilt = json['year_built'];
    transactionType = json['transaction_type'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    wFor = json['w_for'];
    recmnded = json['recmnded'];
    superHot = json['super_hot'];
    hot = json['hot'];
    contactPerson = json['contact_person'];
    landline = json['landline'];
    video = json['video'];
    insertVia = json['insert_via'];
    slugZ = json['slug_z'];
    verified = json['verified'];
    site = json['site'];
    nSendAt = json['n_send_at'];
    extendedOn = json['extended_on'];
    featuredE = json['featured_e'];
    fED = json['f_e_d'];
    fStatus = json['f_status'];
    view360 = json['view_360'];
    clientRef = json['client_ref'];
    propertyStatus = json['property_status'];
    viewVideo = json['view_video'];
    viewFloor = json['view_floor'];
    interiorSize = json['interior_size'];
    areaUnit1 = json['area_unit_1'];
    cronFeatured = json['cron_featured'];
    cronExpiry = json['cron_expiry'];
    cronImages = json['cron_images'];
    cronUpdated = json['cron_updated'];
    cronSimage = json['cron_simage'];
    cronArabic = json['cron_arabic'];
    userUpdated = json['user_updated'];
    slugEn = json['slug_en'];
    slugAr = json['slug_ar'];
    slugCronUpdated = json['slug_cron_updated'];
    metaTitleAr = json['meta_title_ar'];
    metaDescriptionAr = json['meta_description_ar'];
    packageUsed = json['package_used'];
    pId = json['p_id'];
    pUrl = json['p_url'];
    isMor = json['is_mor'];
    detailsIsMor = json['details_is_mor'];
    rights = json['rights'];
    detailsRights = json['details_rights'];
    mayAffect = json['may_affect'];
    rFacade = json['r_facade'];
    disputes = json['disputes'];
    lNo = json['l_no'];
    planNo = json['plan_no'];
    noOfU = json['no_of_u'];
    floorNo = json['floor_no'];
    unitNo = json['unit_no'];
    sellingPrice = json['selling_price'];
    cDate = json['c_date'];
    pLimits = json['p_limits'];
    aCharaAr = json['a_chara_ar'];
    length = json['length'];
    width = json['width'];
    totalArea = json['total_area'];
    authNumber = json['auth_number'];
    streetWidth = json['street_width'];
    detailsMayAffect = json['details_may_affect'];
    numOfFloors = json['num_of_floors'];
    propManUnitId = json['prop_man_unit_id'];
    score = json['score'];
    regaAdvertiserId = json['rega_advertiser_id'];
    regaAdvertisingLicenseNumber = json['rega_advertising_license_number'];
    regaDeedNumber = json['rega_deed_number'];
    regaAdvertiserName = json['rega_advertiser_name'];
    regaEstateBrokerage = json['rega_estate_brokerage'];
    regaAdditionalFigure = json['rega_additional_figure'];
    regaRestriction = json['rega_restriction'];
    regaWarranties = json['rega_warranties'];
    regaCompliance = json['rega_compliance'];
    regaBuildingNumber = json['rega_building_number'];
    regaAdvertisingChannelsN = json['rega_advertising_channels_n'];
    regaRealEstateServices = json['rega_real_estate_services'];
    regaStartDateLicense = json['rega_start_date_license'];
    regaExpiryDateLicense = json['rega_expiry_date_license'];
    regaQrCodeLink = json['rega_qr_code_link'];
    regaPostalCode = json['rega_postal_code'];
    regaResponse = json['rega_response'];
    tinyurl = json['tinyurl'];
    regaIsHalted = json['rega_isHalted'];
    regaIsTestment = json['rega_isTestment'];
    regaRerConstraints = json['rega_rerConstraints'];
    regaLandTotalPrice = json['rega_landTotalPrice'];
    regaLandTotalAnnualRent = json['rega_LandTotalAnnualRent'];
    regaLandNumber = json['rega_landNumber'];
    regaAdLicenseURL = json['rega_adLicenseURL'];
    regaAdSource = json['rega_adSource'];
    regaTitleDeedTypeName = json['rega_titleDeedTypeName'];
    regaLocationDescriptionOnMOJDeed =
    json['rega_locationDescriptionOnMOJDeed'];
    regaNotes = json['rega_notes'];
    regaBorders = json['rega_borders'];
    regaRerBorders = json['rega_rerBorders'];
    regaChannels = json['rega_channels'];
    regaPropertyUtilities = json['rega_propertyUtilities'];
    regaRegion = json['rega_region'];
    regaRegionCode = json['rega_regionCode'];
    regaPhoneNumber = json['rega_phoneNumber'];
    regaQrImage = json['rega_qr_image'];
    url = json['url'];
    statename = json['statename'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    staterel = json['staterel'];
    neighborhoodRel = json['neighborhood_rel'];
    stateRel = json['state_rel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['section_id'] = this.sectionId;
    data['listing_type'] = this.listingType;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['ad_title'] = this.adTitle;
    data['ad_description'] = this.adDescription;
    data['price'] = this.price;
    data['p_o_r'] = this.pOR;
    data['price_to'] = this.priceTo;
    data['price_to_false'] = this.priceToFalse;
    data['price_false'] = this.priceFalse;
    data['from_price_unit'] = this.fromPriceUnit;
    data['to_price_unit'] = this.toPriceUnit;
    data['area_unit'] = this.areaUnit;
    data['model'] = this.model;
    data['country'] = this.country;
    data['region'] = this.region;
    data['state'] = this.state;
    data['city'] = this.city;
    data['neighborhood'] = this.neighborhood;
    data['neighborhood_id'] = this.neighborhoodId;
    data['district'] = this.district;
    data['address_info'] = this.addressInfo;
    data['mobile_number'] = this.mobileNumber;
    data['bathrooms'] = this.bathrooms;
    data['bedrooms'] = this.bedrooms;
    data['balconies'] = this.balconies;
    data['user_id'] = this.userId;
    data['date_added'] = this.dateAdded;
    data['last_updated'] = this.lastUpdated;
    data['priority'] = this.priority;
    data['isTrash'] = this.isTrash;
    data['status'] = this.status;
    data['slug'] = this.slug;
    data['image'] = this.image;
    //data['dynamic'] = this.dynamic;
    data['location_latitude'] = this.locationLatitude;
    data['location_longitude'] = this.locationLongitude;
    data['featured'] = this.featured;
    data['area_location'] = this.areaLocation;
    data['xml_inserted'] = this.xmlInserted;
    data['code'] = this.code;
    data['RefNo'] = this.refNo;
    data['community_id'] = this.communityId;
    data['sub_community_id'] = this.subCommunityId;
    data['property_name'] = this.propertyName;
    data['builtup_area'] = this.builtupArea;
    data['plot_area'] = this.plotArea;
    data['PrimaryUnitView'] = this.primaryUnitView;

    data['total_floor'] = this.totalFloor;
    data['HandoverDate'] = this.handoverDate;
    data['parking'] = this.parking;
    data['salesman_email'] = this.salesmanEmail;
    data['expiry_date'] = this.expiryDate;
    data['mandate'] = this.mandate;
    data['currency_abr'] = this.currencyAbr;
    data['area_measurement'] = this.areaMeasurement;
    data['RetUnitCategory'] = this.retUnitCategory;
    data['RecommendedProperties'] = this.recommendedProperties;
    data['PropertyID'] = this.propertyID;
    data['ReraStrNo'] = this.reraStrNo;
    data['Rent'] = this.rent;
    data['RentPerMonth'] = this.rentPerMonth;
    data['occupant_status'] = this.occupantStatus;
    data['rent_paid'] = this.rentPaid;
    data['nearest_metro'] = this.nearestMetro;
    data['nearest_railway'] = this.nearestRailway;
    data['construction_status'] = this.constructionStatus;
    data['furnished'] = this.furnished;
    data['maid_room'] = this.maidRoom;
    data['rera_no'] = this.reraNo;
    data['year_built'] = this.yearBuilt;
    data['transaction_type'] = this.transactionType;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['w_for'] = this.wFor;
    data['recmnded'] = this.recmnded;
    data['super_hot'] = this.superHot;
    data['hot'] = this.hot;
    data['contact_person'] = this.contactPerson;
    data['landline'] = this.landline;
    data['video'] = this.video;
    data['insert_via'] = this.insertVia;
    data['slug_z'] = this.slugZ;
    data['verified'] = this.verified;
    data['site'] = this.site;
    data['n_send_at'] = this.nSendAt;
    data['extended_on'] = this.extendedOn;
    data['featured_e'] = this.featuredE;
    data['f_e_d'] = this.fED;
    data['f_status'] = this.fStatus;
    data['view_360'] = this.view360;
    data['client_ref'] = this.clientRef;
    data['property_status'] = this.propertyStatus;
    data['view_video'] = this.viewVideo;
    data['view_floor'] = this.viewFloor;
    data['interior_size'] = this.interiorSize;
    data['area_unit_1'] = this.areaUnit1;
    data['cron_featured'] = this.cronFeatured;
    data['cron_expiry'] = this.cronExpiry;
    data['cron_images'] = this.cronImages;
    data['cron_updated'] = this.cronUpdated;
    data['cron_simage'] = this.cronSimage;
    data['cron_arabic'] = this.cronArabic;
    data['user_updated'] = this.userUpdated;
    data['slug_en'] = this.slugEn;
    data['slug_ar'] = this.slugAr;
    data['slug_cron_updated'] = this.slugCronUpdated;
    data['meta_title_ar'] = this.metaTitleAr;
    data['meta_description_ar'] = this.metaDescriptionAr;
    data['package_used'] = this.packageUsed;
    data['p_id'] = this.pId;
    data['p_url'] = this.pUrl;
    data['is_mor'] = this.isMor;
    data['details_is_mor'] = this.detailsIsMor;
    data['rights'] = this.rights;
    data['details_rights'] = this.detailsRights;
    data['may_affect'] = this.mayAffect;
    data['r_facade'] = this.rFacade;
    data['disputes'] = this.disputes;
    data['l_no'] = this.lNo;
    data['plan_no'] = this.planNo;
    data['no_of_u'] = this.noOfU;
    data['floor_no'] = this.floorNo;
    data['unit_no'] = this.unitNo;
    data['selling_price'] = this.sellingPrice;
    data['c_date'] = this.cDate;
    data['p_limits'] = this.pLimits;
    data['a_chara_ar'] = this.aCharaAr;
    data['length'] = this.length;
    data['width'] = this.width;
    data['total_area'] = this.totalArea;
    data['auth_number'] = this.authNumber;
    data['street_width'] = this.streetWidth;
    data['details_may_affect'] = this.detailsMayAffect;
    data['num_of_floors'] = this.numOfFloors;
    data['prop_man_unit_id'] = this.propManUnitId;
    data['score'] = this.score;
    data['rega_advertiser_id'] = this.regaAdvertiserId;
    data['rega_advertising_license_number'] = this.regaAdvertisingLicenseNumber;
    data['rega_deed_number'] = this.regaDeedNumber;
    data['rega_advertiser_name'] = this.regaAdvertiserName;
    data['rega_estate_brokerage'] = this.regaEstateBrokerage;
    data['rega_additional_figure'] = this.regaAdditionalFigure;
    data['rega_restriction'] = this.regaRestriction;
    data['rega_warranties'] = this.regaWarranties;
    data['rega_compliance'] = this.regaCompliance;
    data['rega_building_number'] = this.regaBuildingNumber;
    data['rega_advertising_channels_n'] = this.regaAdvertisingChannelsN;
    data['rega_real_estate_services'] = this.regaRealEstateServices;
    data['rega_start_date_license'] = this.regaStartDateLicense;
    data['rega_expiry_date_license'] = this.regaExpiryDateLicense;
    data['rega_qr_code_link'] = this.regaQrCodeLink;
    data['rega_postal_code'] = this.regaPostalCode;
    data['rega_response'] = this.regaResponse;
    data['tinyurl'] = this.tinyurl;
    data['rega_isHalted'] = this.regaIsHalted;
    data['rega_isTestment'] = this.regaIsTestment;
    data['rega_rerConstraints'] = this.regaRerConstraints;
    data['rega_landTotalPrice'] = this.regaLandTotalPrice;
    data['rega_LandTotalAnnualRent'] = this.regaLandTotalAnnualRent;
    data['rega_landNumber'] = this.regaLandNumber;
    data['rega_adLicenseURL'] = this.regaAdLicenseURL;
    data['rega_adSource'] = this.regaAdSource;
    data['rega_titleDeedTypeName'] = this.regaTitleDeedTypeName;
    data['rega_locationDescriptionOnMOJDeed'] =
        this.regaLocationDescriptionOnMOJDeed;
    data['rega_notes'] = this.regaNotes;
    data['rega_borders'] = this.regaBorders;
    data['rega_rerBorders'] = this.regaRerBorders;
    data['rega_channels'] = this.regaChannels;
    data['rega_propertyUtilities'] = this.regaPropertyUtilities;
    data['rega_region'] = this.regaRegion;
    data['rega_regionCode'] = this.regaRegionCode;
    data['rega_phoneNumber'] = this.regaPhoneNumber;
    data['rega_qr_image'] = this.regaQrImage;
    data['url'] = this.url;
    data['statename'] = this.statename;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['staterel'] = this.staterel;
    data['neighborhood_rel'] = this.neighborhoodRel;
    data['state_rel'] = this.stateRel;
    return data;
  }
}
