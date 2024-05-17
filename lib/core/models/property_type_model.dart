class PropertyTypeModel {

  final String icon;
  final String title;
  final bool isSelected;

  PropertyTypeModel({
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  PropertyTypeModel copyWith({
    String? icon,
    String? title,
    bool? isSelected,
  }) {
    return PropertyTypeModel(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}