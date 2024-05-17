import 'dart:convert';
import 'dart:io';
import 'package:mafatih/core/app/apis.dart';
import 'package:http/http.dart' as http;
import 'package:mafatih/core/models/general_response.dart';
import 'package:mafatih/features/my_account/favourite_properties/models/delete_favourite_property_response.dart';
import 'dart:async';
import 'dart:developer';
import 'package:mafatih/features/my_account/favourite_properties/models/favourite_properties_response.dart';


class FavouriteService {

  static Future<FavouritePropertiesResponse> getFavouriteProperties() async {

    FavouritePropertiesResponse favouritePropertiesResponse = FavouritePropertiesResponse();
    String url = '${APIs.baseURL}${APIs.favoriteProperties}';

    try {
      log('url: $url');
      log('token fav: ${APIs.token}');

      var response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      log('Response status: ${response.statusCode}');
      log('favourite properties response: ${response.body}');


      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        favouritePropertiesResponse = FavouritePropertiesResponse.fromJson(result);

        return favouritePropertiesResponse;
      } else if (response.statusCode == 401) {
        return FavouritePropertiesResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 500) {
        return FavouritePropertiesResponse(status: 0, message: 'Server Error');
      } else {
        return FavouritePropertiesResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return FavouritePropertiesResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return FavouritePropertiesResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return FavouritePropertiesResponse(
          status: 0, message: 'Bad response format');
    } finally {

    }
  }

  static Future<DeleteFavouritePropertyResponse> deleteFavouriteProperty(int propertyId) async {

    DeleteFavouritePropertyResponse verifyPhoneResponse;
    String url = APIs.baseURL + APIs.deleteFavouriteProperty;

    try {
      var body = {'property_id': propertyId};

      print('url: $url');
      print('body: ${body.toString()}');

      var response =
      await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      print('Response status: ${response.statusCode}');
      log('delete favourite property response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        verifyPhoneResponse = DeleteFavouritePropertyResponse.fromJson(result);

        return verifyPhoneResponse;
      } else if (response.statusCode == 401) {
        return DeleteFavouritePropertyResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 404) {
        return DeleteFavouritePropertyResponse(
            status: 0, message: result['errors'][0]['message']);
      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return DeleteFavouritePropertyResponse(status: 0, message: errorValue);
      } else if (response.statusCode == 500) {
        return DeleteFavouritePropertyResponse(status: 0, message: 'Server Error');
      } else {
        return DeleteFavouritePropertyResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return DeleteFavouritePropertyResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return DeleteFavouritePropertyResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (e) {
      return DeleteFavouritePropertyResponse(status: 0, message: 'Bad response format');
    } finally {}
  }



}
