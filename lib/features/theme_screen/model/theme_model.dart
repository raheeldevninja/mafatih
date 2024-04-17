class ThemeModel {

  final String themeName;
  final String themeIcon;
  final bool isSelected;

  ThemeModel({
    required this.themeName,
    required this.themeIcon,
    this.isSelected = false,
  });

  ThemeModel copyWith({
    String? themeName,
    String? themeIcon,
    bool? isSelected,
  }) {
    return ThemeModel(
      themeName: themeName ?? this.themeName,
      themeIcon: themeIcon ?? this.themeIcon,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}