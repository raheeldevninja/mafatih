import 'dart:convert';
import 'dart:io';
import 'package:mafatih/core/app/apis.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:developer';
import 'package:mafatih/features/agencies/model/agencies_response.dart';


class AgencyService {

  static Future<AgenciesResponse> getAgencies(int page, int featured) async {

    AgenciesResponse agenciesResponse;

    String url = '${APIs.baseURL}${APIs.agencies}?page=$page&featured=$featured';

    try {
      log('url: $url');

      var response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${APIs.token}'
      });

      log('Response status: ${response.statusCode}');
      log('get agencies response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        agenciesResponse = AgenciesResponse.fromJson(result);

        return agenciesResponse;
      } else if (response.statusCode == 401) {
        return AgenciesResponse(
            status: 0, message: result['error']);
      } else if (response.statusCode == 500) {
        return AgenciesResponse(status: 0, message: 'Server Error');
      } else {
        return AgenciesResponse(
            status: 0, message: 'Something went wrong !');
      }
    } on SocketException {
      return AgenciesResponse(
          status: 0, message: 'Not connect to internet !');
    } on TimeoutException catch (_) {
      return AgenciesResponse(status: 0, message: 'Request timeout');
    } on FormatException catch (_) {
      return AgenciesResponse(
          status: 0, message: 'Bad response format');
    } finally {

    }
  }


}
