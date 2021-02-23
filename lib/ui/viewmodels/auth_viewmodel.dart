import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learflutter/components/molecules/dialog_loading_progress.dart';
import 'package:learflutter/data/models/profile.dart';
import 'package:learflutter/data/models/response.dart';
import 'package:learflutter/data/service/local_service.dart';
import 'package:learflutter/data/service/network_service.dart';
import 'package:learflutter/ui/view/home/home.dart';
import 'package:learflutter/ui/view/login_register/login_register.dart';
import 'package:learflutter/ui/view/pages/login/login_page.dart';
import 'package:learflutter/ui/view/pages/register/register_page.dart';
import 'package:learflutter/utils/navigation.dart';
import 'package:learflutter/utils/show_snackbar.dart';

class AuthViewmodel extends ChangeNotifier {
  //property of auth provider
  bool _isLogedIn = false;
  String _email;
  String _uid;
  Profile _profile;

  final _localService = LocalService.instance;
  final _networkService = NetworkService.instance;

  //construct auth provider with data
  AuthViewmodel() {
    loadLoginDetails();
    if (_isLogedIn) loadProfile();
  }
  //method get property of auth provider
  bool get isLogedIn => _isLogedIn;
  String get email => _email;
  String get uid => _uid;
  Profile get profile => _profile;

  //load profile of user
  Future loadProfile() async {
    _profile = await _networkService.getProfile();
    notifyListeners();
  }

  //update profile user
  Future updateProfile(BuildContext context, Profile _newProfile) async {
    ResponseDefault result = await _networkService.updateProfile(_newProfile);
    loadProfile();
    showSnackbar(context, result.data['message']);
  }

  //load saved login details
  Future loadLoginDetails() async {
    _isLogedIn = await _localService.isLogin();
    if (_isLogedIn) {
      var _loginDetails = await _localService.getLoginDetails();
      _email = _loginDetails['email'];
      _uid = _loginDetails['uid'];
    }
    notifyListeners();
  }

  Future logout(BuildContext context) async {
    await _localService.removeSaveLogin();
    _profile = null;
    _email = null;
    _uid = null;
    loadLoginDetails();

    replaceScreenTo(context, LoginRegister());
  }

  Future login(String email, String password, BuildContext context) async {
    Dialogs.showLoadingDialog(context, LoginPage.keyLoader);
    ResponseDefault result = await _networkService.loginUser(
      _email,
      password,
    );
    Dialogs.hideLoadingDialog(LoginPage.keyLoader);

    showSnackbar(context, result.data['message']);
    if (result.data['result'] ?? false) {
      _localService.saveLoginDetails(email, result.data['id']);
      loadLoginDetails();
      replaceScreenTo(
        context,
        Home(),
      );
    }
  }

  Future register(String email, String password, BuildContext context) async {
    Dialogs.showLoadingDialog(context, RegisterPage.keyLoader);
    ResponseDefault result = await _networkService.registerUser(
      email,
      password,
    );
    Dialogs.hideLoadingDialog(RegisterPage.keyLoader);
    showSnackbar(context, result.data['message']);
    if (result.data['result'] ?? false) {
      _localService.saveLoginDetails(email, result.data['id']);
      loadLoginDetails();
      replaceScreenTo(
        context,
        Home(
          initialPage: 3,
        ),
      );
    }
  }
}
