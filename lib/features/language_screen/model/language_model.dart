class LanguageModel {

  final String languageName;
  final bool isSelected;

  LanguageModel({
    required this.languageName,
    this.isSelected = false,
  });

  LanguageModel copyWith({
    String? languageName,
    bool? isSelected,
  }) {
    return LanguageModel(
      languageName: languageName ?? this.languageName,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}