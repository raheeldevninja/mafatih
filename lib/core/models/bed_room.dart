class BedRoom {
  final String id;
  final String name;
  final bool isSelected;

  BedRoom({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  BedRoom copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return BedRoom(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}