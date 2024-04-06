class PropertyUsage {
  final String id;
  final String name;
  final bool isSelected;

  PropertyUsage({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  PropertyUsage copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return PropertyUsage(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}