import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/my_account/property_requests/model/delete_property_request_response.dart';
import 'package:mafatih/features/my_account/property_requests/model/property_requests_response.dart';
import 'package:mafatih/features/my_account/property_requests/services/property_requests_service.dart';


class PropertyRequestsProvider extends ChangeNotifier {

  bool isLoading = false;

  PropertyRequestsResponse? propertyRequestsResponse;
  DeletePropertyRequestResponse? deletePropertyRequestResponse;


  Future<void> getPropertyRequests(BuildContext context) async {

    showLoading();
    propertyRequestsResponse = await PropertyRequestsService.getPropertyRequests();

    if(!context.mounted) {
      return;
    }

    if (propertyRequestsResponse?.status == 1) {

    } else {
      context.showSnackBarMessage(propertyRequestsResponse!.message!, isError: true);
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