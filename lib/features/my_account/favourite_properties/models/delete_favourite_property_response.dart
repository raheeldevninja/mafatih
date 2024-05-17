class DeleteFavouritePropertyResponse {
  int? status;
  String? message;

  DeleteFavouritePropertyResponse({this.status, this.message});

  DeleteFavouritePropertyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
