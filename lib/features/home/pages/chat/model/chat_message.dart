class ChatMessageModel {

  final String message;
  final DateTime time;
  final String image;
  final bool isSender;

  ChatMessageModel({
    required this.message,
    required this.time,
    required this.image,
    required this.isSender,
  });

  ChatMessageModel copyWith({
    String? message,
    DateTime? time,
    String? image,
    bool? isSender,
  }) {
    return ChatMessageModel(
      message: message ?? this.message,
      time: time ?? this.time,
      image: image ?? this.image,
      isSender: isSender ?? this.isSender,
    );
  }


}