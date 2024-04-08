class Complain {

  final String complainNo;
  final String status;
  final String subject;
  final String priority;
  final String message;

  Complain({
    required this.complainNo,
    required this.status,
    required this.subject,
    required this.priority,
    required this.message,
  });

  Complain copyWith({
    String? complainNo,
    String? status,
    String? subject,
    String? priority,
    String? message,
  }) {
    return Complain(
      complainNo: complainNo ?? this.complainNo,
      status: status ?? this.status,
      subject: subject ?? this.subject,
      priority: priority ?? this.priority,
      message: message ?? this.message,
    );
  }



}