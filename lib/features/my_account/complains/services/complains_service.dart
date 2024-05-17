import 'dart:convert';
import 'dart:io';
import 'package:mafatih/core/app/apis.dart';
import 'package:http/http.dart' as http;
import 'package:mafatih/features/my_account/complains/model/complains_response.dart';
import 'dart:async';
import 'dart:developer';
import 'package:mafatih/features/my_account/complains/model/delete_complain_response.dart';


class ComplainsService {

  static Future<ComplainsResponse> getComplains() async {

    ComplainsResponse complainsResponse;
    String url = '${APIs.baseURL}${APIs.complains}';

    try {
      log('url: $url');

      var response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      log('Response status: ${response.statusCode}');
      log('get complains response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

         complainsResponse = ComplainsResponse.fromJson(result);

        return complainsResponse;
      } else if (response.statusCode == 401) {
        return ComplainsResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 500) {
        return ComplainsResponse(status: 0, message: 'Server Error');
      } else {
        return ComplainsResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return ComplainsResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return ComplainsResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return ComplainsResponse(
          status: 0, message: 'Bad response format');
    } finally {

    }
  }

  static Future<DeleteComplainResponse> deleteComplain(int id) async {

    DeleteComplainResponse deleteComplainResponse;
    String url = APIs.baseURL + APIs.deleteComplain;

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

      print('Response status: ${response.statusCode}');
      log('delete complain response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        deleteComplainResponse = DeleteComplainResponse.fromJson(result);

        return deleteComplainResponse;
      } else if (response.statusCode == 401) {
        return DeleteComplainResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 404) {
        return DeleteComplainResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return DeleteComplainResponse(status: 0, message: errorValue);
      } else if (response.statusCode == 500) {
        return DeleteComplainResponse(status: 0, message: 'Server Error');
      } else {
        return DeleteComplainResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return DeleteComplainResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return DeleteComplainResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (e) {
      return DeleteComplainResponse(status: 0, message: 'Bad response format');
    } finally {}
  }


}
