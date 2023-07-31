import 'package:shared_preferences/shared_preferences.dart';

class EndpointsKeyShared {
  void saveRegionId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('regionId', id);
    print(prefs.get('regionId'));
  }

  Future<String> regionId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String region = prefs.get('regionId').toString();

    return region;
  }

  void saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> userToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String token = prefs.get('token').toString();

    return token;
  }
}
