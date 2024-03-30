class MainMenu {

  final String title;
  final String icon;
  bool isSelected;

  MainMenu({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });


  MainMenu copyWith({
    String? title,
    String? icon,
    bool? isSelected,
  }) {
    return MainMenu(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}