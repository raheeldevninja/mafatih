import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/static_pages/services/static_pages_service.dart';
import 'package:mafatih/features/contact_us/model/contact_us_data.dart';
import 'package:mafatih/features/contact_us/model/contact_us_response.dart';
import 'package:mafatih/features/feedback/model/feedback_data.dart';
import 'package:mafatih/features/feedback/model/feedback_response.dart';
import 'package:mafatih/features/my_account/property_requests/model/delete_property_request_response.dart';
import 'package:mafatih/features/my_account/view_records/models/viewed_records_response.dart';
import 'package:mafatih/features/static_pages/model/static_page_response.dart';

class StaticPagesProvider extends ChangeNotifier {

  bool isLoading = false;

  ViewedRecordsResponse? viewedRecordsResponse;
  DeletePropertyRequestResponse? deletePropertyRequestResponse;
  ContactUsResponse? contactUsResponse;
  FeedbackResponse? feedbackResponse;
  StaticPageResponse? staticPageResponse;

  bool get getLoading => isLoading;

  Future<void> contactUs(BuildContext context, ContactUsData contactUsData) async {

    showLoading();
    contactUsResponse = await StaticPagesService.contactUs(contactUsData);

    if(!context.mounted) {
      return;
    }

    if (contactUsResponse?.status == 1) {
      context.showSnackBarMessage(contactUsResponse!.message!);
      Navigator.pop(context);

    } else {
      context.showSnackBarMessage(contactUsResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }


  Future<void> feedback(BuildContext context, FeedbackData feedbackData) async {

    showLoading();
    feedbackResponse = await StaticPagesService.feedback(feedbackData);

    if(!context.mounted) {
      return;
    }

    if (feedbackResponse?.status == 1) {
      context.showSnackBarMessage(feedbackResponse!.message!);

    } else {
      context.showSnackBarMessage(feedbackResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }


  Future<void> getStaticPageContent(BuildContext context, String endPoint) async {

    showLoading();
    staticPageResponse = await StaticPagesService.getStaticPageContent(endPoint);

    if(!context.mounted) {
      return;
    }

    if (staticPageResponse?.status == 1) {

    } else {
      context.showSnackBarMessage(staticPageResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }


  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }

}