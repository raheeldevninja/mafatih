class Neighborhood {

  final String id;
  final String value;

  Neighborhood({
    required this.id,
    required this.value,
  });

  Neighborhood copyWith({
    String? id,
    String? value,
  }) {
    return Neighborhood(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

}