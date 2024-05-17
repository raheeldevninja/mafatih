import 'dart:convert';
import 'dart:io';
import 'package:mafatih/core/app/apis.dart';
import 'package:http/http.dart' as http;
import 'package:mafatih/core/models/general_response.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'dart:async';
import 'dart:developer';
import 'package:mafatih/features/auth/model/login_response.dart';
import 'package:mafatih/features/auth/model/profile_data.dart';
import 'package:mafatih/features/auth/model/register_data.dart';
import 'package:mafatih/features/auth/model/update_profile_response.dart';

class AuthService {

  static Future<LoginResponse> login(String phone, String password) async {
    LoginResponse loginResponse;
    String url = APIs.baseURL + APIs.login;

    try {
      var body = {'phone': phone, 'password': password};

      print('url: $url');
      print('body: ${body.toString()}');

      var response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });

      print('Response status: ${response.statusCode}');
      log('login response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('login response: ${response.statusCode}');
        loginResponse = LoginResponse.fromJson(result);
        loginResponse.success = true;
        loginResponse.message = 'Success';
        return loginResponse;
      } else if (response.statusCode == 401) {
        return LoginResponse(success: false, message: result['errors']);
      } else if (response.statusCode == 500) {
        return LoginResponse(success: false, message: 'Server Error');
      } else {
        return LoginResponse(success: false, message: 'Something went wrong !');
      }
    } on SocketException {
      return LoginResponse(
          success: false, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return LoginResponse(success: false, message: 'Request timeout');
    } on FormatException catch (e) {
      return LoginResponse(success: false, message: 'Bad response format');
    } finally {}
  }

  static Future<GeneralResponse> register(RegisterData registerData) async {
    GeneralResponse registrationResponse;
    String url = APIs.baseURL + APIs.register;

    try {
      print('registration url: $url');
      print('body: ${registerData.toString()}');

      var response = await http.post(Uri.parse(url),
          body: jsonEncode(registerData.toMap()),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          });

      print('Response status: ${response.statusCode}');
      log('registration response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        registrationResponse = GeneralResponse.fromJson(result);
        registrationResponse.status = true;
        registrationResponse.message = 'Success';
        return registrationResponse;
      } else if (response.statusCode == 401) {
        return GeneralResponse(status: false, message: result['errors']);
      } else if (response.statusCode == 403) {
        return GeneralResponse(status: false, message: result['errors']);
      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return GeneralResponse(status: false, message: errorValue);
      } else if (response.statusCode == 500) {
        return GeneralResponse(status: false, message: 'Server Error');
      } else {
        return GeneralResponse(
            status: false, message: 'Something went wrong !');
      }
    } on SocketException {
      return GeneralResponse(
          status: false, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return GeneralResponse(status: false, message: 'Request timeout');
    } on FormatException catch (e) {
      return GeneralResponse(status: false, message: 'Bad response format');
    } finally {}
  }

  static Future<GeneralResponse> verifyPhone(String phone) async {
    GeneralResponse verifyPhoneResponse;
    String url = APIs.baseURL + APIs.verifyPhone;

    try {
      var body = {'phone': phone};

      print('url: $url');
      print('body: ${body.toString()}');

      var response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });

      print('Response status: ${response.statusCode}');
      log('forgot password response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        verifyPhoneResponse = GeneralResponse.fromJson(result);
        verifyPhoneResponse.status = true;
        verifyPhoneResponse.message = 'Success';
        return verifyPhoneResponse;
      } else if (response.statusCode == 401) {
        return GeneralResponse(
            status: false, message: result['errors'][0]['message']);
      } else if (response.statusCode == 404) {
        return GeneralResponse(
            status: false, message: result['errors'][0]['message']);
      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return GeneralResponse(status: false, message: errorValue);
      } else if (response.statusCode == 500) {
        return GeneralResponse(status: false, message: 'Server Error');
      } else {
        return GeneralResponse(
            status: false, message: 'Something went wrong !');
      }
    } on SocketException {
      return GeneralResponse(
          status: false, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return GeneralResponse(status: false, message: 'Request timeout');
    } on FormatException catch (e) {
      return GeneralResponse(status: false, message: 'Bad response format');
    } finally {}
  }

  static Future<GeneralResponse> verifyOTP(String phone, String otp) async {
    GeneralResponse verifyOTPResponse;
    String url = APIs.baseURL + APIs.verifyOTP;

    try {
      var body = {'phone': phone, 'otp': otp};

      print('url: $url');
      print('body: ${body.toString()}');

      var response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });

      print('Response status: ${response.statusCode}');
      print('verify otp response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        verifyOTPResponse = GeneralResponse.fromJson(result);
        verifyOTPResponse.status = true;
        verifyOTPResponse.message = 'Success';
        return verifyOTPResponse;
      } else if (response.statusCode == 401) {
        return GeneralResponse(
            status: false, message: result['errors'][0]['message']);
      } else if (response.statusCode == 404) {
        return GeneralResponse(
            status: false, message: result['errors'][0]['message']);
      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return GeneralResponse(status: false, message: errorValue);
      } else if (response.statusCode == 500) {
        return GeneralResponse(status: false, message: 'Server Error');
      } else {
        return GeneralResponse(
            status: false, message: 'Something went wrong !');
      }
    } on SocketException {
      return GeneralResponse(
          status: false, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return GeneralResponse(status: false, message: 'Request timeout');
    } on FormatException catch (e) {
      return GeneralResponse(status: false, message: 'Bad response format');
    } finally {}
  }

  static Future<GeneralResponse> resetPassword(
      String phone, String otp, String password, String confirmPassword) async {
    GeneralResponse verifyOTPResponse;
    String url = APIs.baseURL + APIs.resetPassword;

    try {
      var body = {
        'phone': phone,
        'otp': otp,
        'password': password,
        'password_confirmation': confirmPassword
      };

      print('url: $url');
      print('body: ${body.toString()}');

      var response =
          await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });

      print('Response status: ${response.statusCode}');
      log('verify otp response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        verifyOTPResponse = GeneralResponse.fromJson(result);
        return verifyOTPResponse;
      } else if (response.statusCode == 401) {

        return GeneralResponse(
            status: false, message: result['error']);

      } else if (response.statusCode == 404) {

        String key = result['errors'].keys.first;
        String value = result['errors'][key].first;


        return GeneralResponse(
            status: false, message: value);
      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return GeneralResponse(status: false, message: errorValue);
      } else if (response.statusCode == 500) {
        return GeneralResponse(status: false, message: 'Server Error');
      } else {
        return GeneralResponse(
            status: false, message: 'Something went wrong !');
      }
    } on SocketException {
      return GeneralResponse(
          status: false, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return GeneralResponse(status: false, message: 'Request timeout');
    } on FormatException catch (e) {
      return GeneralResponse(status: false, message: 'Bad response format');
    } finally {}
  }

  static Future<UpdateProfileResponse> updateProfile(ProfileData profileData) async {
    String accessToken = await SharedPref.getToken();

    log('access token in updateProfile(): $accessToken');


    UpdateProfileResponse updateProfileResponse;
    String url = APIs.baseURL + APIs.updatePassword;

    try {

      print('url: $url');
      print('body: ${jsonEncode(profileData.toJson())}');

      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(profileData.toJson()),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print('Response status: ${response.statusCode}');
      log('update profile response: ${response.body}');

      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {

        updateProfileResponse = UpdateProfileResponse.fromJson(result);
        return updateProfileResponse;

      } else if (response.statusCode == 401) {

        return UpdateProfileResponse(
            status: false, message: result['error']);

      } else if (response.statusCode == 404) {

        String key = result['errors'].keys.first;
        String value = result['errors'][key].first;

        return UpdateProfileResponse(
            status: false, message: value);

      } else if (response.statusCode == 422) {
        String errorValue = '';

        //check if result has errors key
        if (result.containsKey('errors')) {
          //get first key and its value only
          String key = result['errors'].keys.first;
          String value = result['errors'][key].first;

          errorValue = 'error: $key $value';
        }

        return UpdateProfileResponse(status: false, message: errorValue);
      } else if (response.statusCode == 500) {
        return UpdateProfileResponse(status: false, message: 'Server Error');
      } else {
        return UpdateProfileResponse(
            status: false, message: 'Something went wrong !');
      }
    } on SocketException {
      return UpdateProfileResponse(
          status: false, message: 'Not connect to internet !');
    } on TimeoutException catch (e) {
      return UpdateProfileResponse(status: false, message: 'Request timeout');
    } on FormatException catch (e) {
      return UpdateProfileResponse(status: false, message: 'Bad response format');
    } finally {}
  }
}
