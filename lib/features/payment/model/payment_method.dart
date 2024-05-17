class PaymentMethod {

  final String name;
  final String image;
  final bool isSelected;

  PaymentMethod({
    required this.name,
    required this.image,
    this.isSelected = false,
  });

  PaymentMethod copyWith({
    String? name,
    String? image,
    bool? isSelected,
  }) {
    return PaymentMethod(
      name: name ?? this.name,
      image: image ?? this.image,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}