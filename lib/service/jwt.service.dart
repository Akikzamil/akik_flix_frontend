import 'package:akik_drive_frontend/util/env.dart';
import 'package:akik_drive_frontend/util/shared_preference.dart';
import 'package:http/http.dart' as http;
class JWTService{
  Future<bool> isValidJwt() async{
    String url = "${ENV().getMainServerIP()!}/restricted";
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${SharedPreference.instance.getToken()}'
    });
    if(response.statusCode==401) {
      return false;
    } else {
      return true;
    }
  }
}