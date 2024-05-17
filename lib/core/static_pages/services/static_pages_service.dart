import 'dart:convert';
import 'dart:io';
import 'package:mafatih/core/app/apis.dart';
import 'package:http/http.dart' as http;
import 'package:mafatih/core/models/general_response.dart';
import 'package:mafatih/features/contact_us/model/contact_us_data.dart';
import 'package:mafatih/features/contact_us/model/contact_us_response.dart';
import 'dart:async';
import 'dart:developer';

import 'package:mafatih/features/feedback/model/feedback_data.dart';
import 'package:mafatih/features/feedback/model/feedback_response.dart';
import 'package:mafatih/features/static_pages/model/static_page_response.dart';


class StaticPagesService {

  static Future<ContactUsResponse> contactUs(ContactUsData contactUsData) async {

    ContactUsResponse contactUsResponse;
    String url = '${APIs.baseURL}${APIs.contactUs}';

    try {
      log('url: $url');

      var response = await http.post(Uri.parse(url),
          body: jsonEncode(contactUsData.toJson()),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${APIs.token}'
          });

      log('Response status: ${response.statusCode}');
      log('contact us response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        contactUsResponse = ContactUsResponse.fromJson(result);

        return contactUsResponse;
      } else if (response.statusCode == 401) {
        return ContactUsResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 500) {
        return ContactUsResponse(status: 0, message: 'Server Error');
      } else {
        return ContactUsResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return ContactUsResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return ContactUsResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return ContactUsResponse(
          status: 0, message: 'Bad response format');
    } finally {
      log('inside finally');
      contactUsResponse = ContactUsResponse(status: 0, message: 'Something went wrong !');
    }
  }

  static Future<FeedbackResponse> feedback(FeedbackData feedbackData) async {

    FeedbackResponse feedbackResponse;
    String url = '${APIs.baseURL}${APIs.feedback}';

    try {
      log('url: $url');

      var response = await http.post(Uri.parse(url),
          body: jsonEncode(feedbackData.toJson()),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${APIs.token}'
          });

      log('Response status: ${response.statusCode}');
      log('feedback response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        feedbackResponse = FeedbackResponse.fromJson(result);

        return feedbackResponse;
      } else if (response.statusCode == 401) {
        return FeedbackResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 500) {
        return FeedbackResponse(status: 0, message: 'Server Error');
      } else {
        return FeedbackResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return FeedbackResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return FeedbackResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return FeedbackResponse(
          status: 0, message: 'Bad response format');
    } finally {
      log('inside finally');
      feedbackResponse = FeedbackResponse(status: 0, message: 'Something went wrong !');
    }
  }

  static Future<StaticPageResponse> getStaticPageContent(String endPoint) async {

    StaticPageResponse staticPageResponse;
    String url = '${APIs.baseURL}$endPoint';

    try {
      log('url: $url');

      var response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      log('Response status: ${response.statusCode}');
      log('get terms of use response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        staticPageResponse = StaticPageResponse.fromJson(result);

        return staticPageResponse;
      } else if (response.statusCode == 401) {
        return StaticPageResponse(
            status: 0, message: result['errors'][0]['message']);
      } else if (response.statusCode == 500) {
        return StaticPageResponse(status: 0, message: 'Server Error');
      } else {
        return StaticPageResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return StaticPageResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return StaticPageResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return StaticPageResponse(
          status: 0, message: 'Bad response format');
    } finally {

    }
  }

}
