class MarkerData {

  final String title;
  final double lat;
  final double lng;
  final String? favouriteIcon;
  final String? featuredIcon;
  final bool isViewed;

  MarkerData({
    required this.title,
    required this.lat,
    required this.lng,
    this.favouriteIcon,
    this.featuredIcon,
    this.isViewed = false,
  });

  MarkerData copyWith({
    String? title,
    double? lat,
    double? lng,
    String? favouriteIcon,
    String? featuredIcon,
    bool? isViewed,
  }) {
    return MarkerData(
      title: title ?? this.title,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      favouriteIcon: favouriteIcon ?? this.favouriteIcon,
      featuredIcon: featuredIcon ?? this.featuredIcon,
      isViewed: isViewed ?? this.isViewed,
    );
  }

}