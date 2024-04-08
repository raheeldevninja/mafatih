class NotificationModel {
  final String title;
  final String description;
  final String date;
  final String time;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.isRead = false,
  });

  NotificationModel copyWith({
    String? title,
    String? description,
    String? date,
    String? time,
    bool? isRead,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
    );
  }

}