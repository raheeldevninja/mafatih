class StaticPageResponse {
  int? status;
  String? message;
  Data? data;

  StaticPageResponse({this.status, this.message, this.data});

  StaticPageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? articleId;
  String? title;
  String? content;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  Null? coverImage;

  Data(
      {this.articleId,
        this.title,
        this.content,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.coverImage});

  Data.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    content = json['content'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    coverImage = json['cover_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    data['cover_image'] = this.coverImage;
    return data;
  }
}
