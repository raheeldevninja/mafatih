import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/my_account/property_requests/model/delete_property_request_response.dart';
import 'package:mafatih/features/my_account/property_requests/services/property_requests_service.dart';
import 'package:mafatih/features/my_account/view_records/models/viewed_records_response.dart';
import 'package:mafatih/features/my_account/view_records/services/viewed_records_service.dart';


class ViewedRecordsProvider extends ChangeNotifier {

  bool isLoading = false;

  ViewedRecordsResponse? viewedRecordsResponse;
  DeletePropertyRequestResponse? deletePropertyRequestResponse;


  Future<void> getViewedRecords(BuildContext context) async {

    showLoading();
    viewedRecordsResponse = await ViewedRecordsService.getViewedRecords();

    if(!context.mounted) {
      return;
    }

    if (viewedRecordsResponse?.status == 1) {

    } else {
      context.showSnackBarMessage(viewedRecordsResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }


  Future<void> deletePropertyRequest(BuildContext context, int id) async {

    showLoading();

    deletePropertyRequestResponse = await PropertyRequestsService.deletePropertyRequests(id);

    if(context.mounted) {

      if (deletePropertyRequestResponse!.status! == 1) {
        context.showSnackBarMessage(deletePropertyRequestResponse!.message!);
      } else {
        context.showSnackBarMessage(deletePropertyRequestResponse!.message!, isError: true);
      }

    }
    else {
      print('not mounted');
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