import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mafatih/core/app/apis.dart';
import 'package:mafatih/core/extension/context.dart';
import 'package:mafatih/core/models/general_response.dart';
import 'package:mafatih/core/models/user.dart';
import 'package:mafatih/core/util/shared_pref.dart';
import 'package:mafatih/features/auth/login_screen.dart';
import 'package:mafatih/features/auth/model/login_response.dart';
import 'package:mafatih/features/auth/model/profile_data.dart';
import 'package:mafatih/features/auth/model/register_data.dart';
import 'package:mafatih/features/auth/model/update_profile_response.dart';
import 'package:mafatih/features/auth/new_password_screen.dart';
import 'package:mafatih/features/auth/service/auth_service.dart';
import 'package:mafatih/features/auth/verify_otp_screen.dart';
import 'package:mafatih/features/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {

  bool isLoading = false;


  LoginResponse? loginResponse;
  GeneralResponse? generalResponse;
  UpdateProfileResponse? updateProfileResponse;
  User? userData;
  String? token;
  bool isLoggedIn = false;


  login(BuildContext context, String phone, String password) async {
    showLoading();

    loginResponse = await AuthService.login(phone, password);

    if(!context.mounted) {
      return;
    }

    debugPrint('login response: ${loginResponse.toString()}');


    if (loginResponse!.success!) {

      saveLoginStatusToSharedPref(true);
      saveUserToSharedPref(loginResponse!.user!);
      saveTokenToSharedPref(loginResponse!.accessToken!);

      if(context.mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }

    } else {
      saveLoginStatusToSharedPref(false);
      context.showSnackBarMessage(loginResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }

  register(BuildContext context, RegisterData registerData) async {

    showLoading();
    generalResponse = await AuthService.register(registerData);

    if (generalResponse!.status!) {
      saveLoginStatusToSharedPref(true);

    } else {
      context.showSnackBarMessage(generalResponse!.message!, isError: true);
      saveLoginStatusToSharedPref(false);
    }

    hideLoading();
    notifyListeners();
  }

  verifyPhone(BuildContext context, String phone) async {

    showLoading();

    generalResponse = await AuthService.verifyPhone(phone);

    if (generalResponse!.status!) {

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerifyOTPScreen(phoneNumber: phone),
        ),
      );


    } else {
      context.showSnackBarMessage(generalResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }

  verifyOTP(BuildContext context, String phone, String otp) async {

    showLoading();

    generalResponse = await AuthService.verifyOTP(phone, otp);

    if (generalResponse!.status!) {


      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewPasswordScreen(phone: phone, otp: otp),
        ),
      );


    } else {
      context.showSnackBarMessage(generalResponse!.message!, isError: true);
    }


    hideLoading();
    notifyListeners();
  }

  resetPassword(BuildContext context, String phone, String otp, String password, String confirmPassword) async {

    showLoading();

    generalResponse = await AuthService.resetPassword(phone, otp, password, confirmPassword);

    if(!context.mounted) {
      return;
    }

    if (generalResponse!.status!) {

      context.showSnackBarMessage(generalResponse!.message!);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen()),
              (route) => false);

    } else {
      context.showSnackBarMessage(generalResponse!.message!, isError: true);
    }


    hideLoading();
    notifyListeners();
  }

  updateProfile(BuildContext context, ProfileData profileData) async {

    showLoading();

    updateProfileResponse = await AuthService.updateProfile(profileData);

    if(!context.mounted) {
      return;
    }

    if (updateProfileResponse!.status!) {


      saveUserToSharedPref(updateProfileResponse!.user!);

      context.showSnackBarMessage(updateProfileResponse!.message!);
      Navigator.pop(context);

    } else {
      context.showSnackBarMessage(updateProfileResponse!.message!, isError: true);
    }

    hideLoading();
    notifyListeners();
  }

  saveUserToSharedPref(User user) {
    SharedPref.saveUser(user);
    userData = user;
    notifyListeners();
  }

  getUserDataFromSharedPref() async {
    userData = await SharedPref.getUser();
    notifyListeners();
  }

  User get getUserData => userData ?? User();

  saveTokenToSharedPref(String token) {
    SharedPref.saveToken(token);
    this.token = token;
    APIs.token = token;

    notifyListeners();
  }

  ///call this function on app start
  getTokenFromSharedPref() async {
    token = await SharedPref.getToken();
    APIs.token = token!;

    log('static token: $token');
    log('token: $token');
    notifyListeners();
  }

  String? get getToken => token;


  saveLoginStatusToSharedPref(bool isLoggedIn) {

    SharedPref.setLoggedIn(isLoggedIn);
    this.isLoggedIn = isLoggedIn;

    notifyListeners();
  }

  ///call this function on app start
  getLoginStatusFromSharedPref() async {
    isLoggedIn = await SharedPref.isLoggedIn();
    notifyListeners();
  }

  bool get getIsLoggedIn => isLoggedIn;

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }

}