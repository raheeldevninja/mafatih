class Keyword {
  
  final String id;
  final String value;
  
  Keyword({
    required this.id,
    required this.value,
  });
  
  Keyword copyWith({
    String? id,
    String? value,
  }) {
    return Keyword(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }
  
}