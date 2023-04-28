import 'package:akik_drive_frontend/model/user.dart';
import 'package:akik_drive_frontend/page/home_page.dart';
import 'package:akik_drive_frontend/service/auth.dart';
import 'package:flutter/material.dart';

class Login{
  login(BuildContext context,String phone,String countryCode,String password,bool isBusy)async{
    User user = User.fromOtp(phone, countryCode, password);
    try{
      isBusy=true;
      int statusCode = await Auth().login(user);
      isBusy=false;
      if(statusCode==200){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      }
    }catch(e){
      print(e);
    }


  }
}