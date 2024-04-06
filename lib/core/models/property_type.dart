class PropertyType {
  final String id;
  final String name;
  final bool isSelected;

  PropertyType({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  PropertyType copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return PropertyType(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}