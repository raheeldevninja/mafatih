class BedRoomModel {
  final String id;
  final String name;
  final bool isSelected;

  BedRoomModel({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  BedRoomModel copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return BedRoomModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}