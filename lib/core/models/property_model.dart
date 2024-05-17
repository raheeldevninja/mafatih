class PropertyModel {
  final String propertyName;
  final String price;
  final String area;
  final String beds;
  final String tvLounge;
  final String bath;
  final String address;
  final String addOwner;
  final String ownerImage;
  final bool isFavourite;

  final List<String> images;

  PropertyModel({
    required this.propertyName,
    required this.price,
    required this.area,
    required this.beds,
    required this.tvLounge,
    required this.bath,
    required this.address,
    required this.addOwner,
    required this.ownerImage,
    required this.images,
    this.isFavourite = false,
  });

  PropertyModel copyWith({
    String? propertyName,
    String? price,
    String? area,
    String? beds,
    String? tvLounge,
    String? bath,
    String? address,
    String? addOwner,
    String? ownerImage,
    List<String>? images,
    bool? isFavourite,
  }) {
    return PropertyModel(
      propertyName: propertyName ?? this.propertyName,
      price: price ?? this.price,
      area: area ?? this.area,
      beds: beds ?? this.beds,
      tvLounge: tvLounge ?? this.tvLounge,
      bath: bath ?? this.bath,
      address: address ?? this.address,
      addOwner: addOwner ?? this.addOwner,
      ownerImage: ownerImage ?? this.ownerImage,
      images: images ?? this.images,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
