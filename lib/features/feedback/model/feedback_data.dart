class FeedbackData {

  final double rating;
  final String message;

  FeedbackData({
    required this.rating,
    required this.message,
  });

  FeedbackData copyWith({
    double? rating,
    String? message,
  }) {
    return FeedbackData(
      rating: rating ?? this.rating,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rating'] = rating;
    data['message'] = message;
    return data;
  }

}