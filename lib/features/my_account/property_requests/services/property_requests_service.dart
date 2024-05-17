import 'dart:convert';
import 'dart:io';
import 'package:mafatih/core/app/apis.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:developer';
import 'package:mafatih/features/my_account/property_requests/model/delete_property_request_response.dart';
import 'package:mafatih/features/my_account/property_requests/model/property_requests_response.dart';


class PropertyRequestsService {

  static Future<PropertyRequestsResponse> getPropertyRequests() async {

    PropertyRequestsResponse propertyRequestsResponse;
    String url = '${APIs.baseURL}${APIs.getPropertyRequests}';

    try {
      log('url: $url');

      var response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      log('Response status: ${response.statusCode}');
      log('property requests response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        propertyRequestsResponse = PropertyRequestsResponse.fromJson(result);

        return propertyRequestsResponse;
      } else if (response.statusCode == 401) {
        return PropertyRequestsResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 500) {
        return PropertyRequestsResponse(status: 0, message: 'Server Error');
      } else {
        return PropertyRequestsResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return PropertyRequestsResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return PropertyRequestsResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return PropertyRequestsResponse(
          status: 0, message: 'Bad response format');
    } finally {

    }
  }

  static Future<DeletePropertyRequestResponse> deletePropertyRequests(int id) async {

    DeletePropertyRequestResponse deleteComplainResponse;
    String url = APIs.baseURL + APIs.deletePropertyRequests;

    try {
      var body = {'id': id};

      print('url: $url');
      print('body: ${body.toString()}');

      var response =
      await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      log('Response status: ${response.statusCode}');
      log('delete property requests response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        deleteComplainResponse = DeletePropertyRequestResponse.fromJson(result);

        return deleteComplainResponse;
      } else if (response.statusCode == 401) {
        return DeletePropertyRequestResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 404) {
        return DeletePropertyRequestResponse(
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

        return DeletePropertyRequestResponse(status: 0, message: errorValue);
      } else if (response.statusCode == 500) {
        return DeletePropertyRequestResponse(status: 0, message: 'Server Error');
      } else {
        return DeletePropertyRequestResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return DeletePropertyRequestResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return DeletePropertyRequestResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (e) {
      return DeletePropertyRequestResponse(status: 0, message: 'Bad response format');
    } finally {}
  }


}
