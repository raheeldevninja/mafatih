import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/agencies/model/agencies_response.dart';
import 'package:mafatih/features/agencies/services/agency_services.dart';


class AgencyProvider extends ChangeNotifier {

  bool isLoading = false;

  AgenciesResponse? agenciesResponse;

  Future<void> getAgencies(BuildContext context, int page, int featured) async {

    showLoading();
    agenciesResponse = await AgencyService.getAgencies(page, featured);

    if(!context.mounted) {
      return;
    }

    if (agenciesResponse?.status == 1) {

    } else {
      context.showSnackBarMessage(agenciesResponse!.message!, isError: true);
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