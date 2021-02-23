import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  //implemment singleton
  static final LocalService _localService = LocalService._internal();
  factory LocalService() => _localService;
  LocalService._internal();
  //create instance property
  static final instance = LocalService();

  final _sharedPreference = SharedPreferences.getInstance();
  isLogin() async {
    final sf = await _sharedPreference;
    return sf.getBool('isLogin') ?? false;
  }

  Future<Map<String, dynamic>> getLoginDetails() async {
    final sf = await _sharedPreference;
    if (await isLogin()) {
      return {'uid': sf.getString("uid"), 'email': sf.getString("email")};
    }
    return null;
  }

  Future<String> getEmail() async {
    final sf = await _sharedPreference;

    return sf.getString("email");
  }

  Future<String> getUID() async {
    final sf = await _sharedPreference;

    return sf.getString("uid");
  }

  saveLoginDetails(String email, String uid) async {
    final sf = await _sharedPreference;
    sf.setBool('isLogin', true);
    sf.setString('uid', uid);
    sf.setString('email', email);
  }

  removeSaveLogin() async {
    final sf = await _sharedPreference;
    sf.clear();
  }
}
