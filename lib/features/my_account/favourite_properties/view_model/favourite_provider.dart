import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/general_response.dart';
import 'package:mafatih/features/my_account/favourite_properties/models/delete_favourite_property_response.dart';
import 'package:mafatih/features/my_account/favourite_properties/models/favourite_properties_response.dart';
import 'package:mafatih/features/my_account/favourite_properties/services/favourite_service.dart';

class FavouriteProvider extends ChangeNotifier {

  bool isLoading = false;


  FavouritePropertiesResponse? favouritePropertiesResponse;
  DeleteFavouritePropertyResponse? deleteFavouritePropertyResponse;

  Future<void> getFavouriteProperties(BuildContext context) async {

    showLoading();

    favouritePropertiesResponse = await FavouriteService.getFavouriteProperties();

    if(!context.mounted) {
      return;
    }

    if (favouritePropertiesResponse?.status == 1) {



    } else {
      context.showSnackBarMessage(favouritePropertiesResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }

  deleteFavouriteProperty(BuildContext context, int propertyId) async {

    showLoading();

    deleteFavouritePropertyResponse = await FavouriteService.deleteFavouriteProperty(propertyId);

    if(context.mounted) {
      if (deleteFavouritePropertyResponse!.status! == 1) {
        context.showSnackBarMessage(deleteFavouritePropertyResponse!.message!);

      } else {
        context.showSnackBarMessage(deleteFavouritePropertyResponse!.message!, isError: true);
      }

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