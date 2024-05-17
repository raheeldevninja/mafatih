import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/features/my_account/complains/model/complains_response.dart';
import 'package:mafatih/features/my_account/complains/model/delete_complain_response.dart';
import 'package:mafatih/features/my_account/complains/services/complains_service.dart';


class ComplainsProvider extends ChangeNotifier {

  bool isLoading = false;

  ComplainsResponse? complainsResponse;
  DeleteComplainResponse? deleteComplainResponse;


  Future<void> getComplains(BuildContext context) async {

    showLoading();
    complainsResponse = await ComplainsService.getComplains();

    if(!context.mounted) {
      return;
    }

    if (complainsResponse?.status == 1) {

    } else {
      context.showSnackBarMessage(complainsResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }


  Future<void> deleteComplain(BuildContext context, int id) async {

    showLoading();

    deleteComplainResponse = await ComplainsService.deleteComplain(id);

    print('delete complain status: ${deleteComplainResponse!.status}');

    if(!context.mounted) {
      return;
    }

    if (deleteComplainResponse!.status! == 1) {
      context.showSnackBarMessage(deleteComplainResponse!.message!);
    } else {
      context.showSnackBarMessage(deleteComplainResponse!.message!, isError: true);
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