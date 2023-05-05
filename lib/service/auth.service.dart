import 'dart:convert';

import 'package:akik_drive_frontend/constant/api_contant.dart';
import 'package:akik_drive_frontend/model/user.dart';
import 'package:akik_drive_frontend/util/env.dart';
import 'package:akik_drive_frontend/util/shared_preference.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future<int> login(User user) async {
    String url = "${ENV().getMainServerIP()!}$loginUrl";
    String userReq = userToJson(user);
    http.Response response = await http
        .post(Uri.parse(url), body: userReq, headers: <String, String>{
      'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);
    String token = data['token'];
    await SharedPreference.instance.setToken(token);
    return response.statusCode;
  }
}
