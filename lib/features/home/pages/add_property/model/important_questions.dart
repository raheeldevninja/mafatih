class PropertyRequest {

  final int requestNo;
  final String status;
  final String propertyUsage;
  final String propertyType;
  final String region;
  final String propertyArea;
  final String numberOfRooms;
  final String price;
  final String moreDetails;

  final int engagedAgents;
  final int calls;
  final int emails;
  final int whatsapp;

  PropertyRequest({
    required this.requestNo,
    required this.status,
    required this.propertyUsage,
    required this.propertyType,
    required this.region,
    required this.propertyArea,
    required this.numberOfRooms,
    required this.price,
    required this.moreDetails,
    required this.engagedAgents,
    required this.calls,
    required this.emails,
    required this.whatsapp,
  });

  PropertyRequest copyWith({
    int? requestNo,
    String? status,
    String? propertyUsage,
    String? propertyType,
    String? region,
    String? propertyArea,
    String? numberOfRooms,
    String? price,
    String? moreDetails,
    int? engagedAgents,
    int? calls,
    int? emails,
    int? whatsapp,
  }) {
    return PropertyRequest(
      requestNo: requestNo ?? this.requestNo,
      status: status ?? this.status,
      propertyUsage: propertyUsage ?? this.propertyUsage,
      propertyType: propertyType ?? this.propertyType,
      region: region ?? this.region,
      propertyArea: propertyArea ?? this.propertyArea,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      price: price ?? this.price,
      moreDetails: moreDetails ?? this.moreDetails,
      engagedAgents: engagedAgents ?? this.engagedAgents,
      calls: calls ?? this.calls,
      emails: emails ?? this.emails,
      whatsapp: whatsapp ?? this.whatsapp,
    );
  }

}