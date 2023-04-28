import 'package:akik_drive_frontend/page/home_page.dart';
import 'package:akik_drive_frontend/page/login_page.dart';
import 'package:akik_drive_frontend/page/sign_up_page.dart';
import 'package:akik_drive_frontend/util/screen_size.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  final String password;
  final String countryCode;
  const OtpPage(
      {Key? key,
      required this.phoneNumber,
      required this.countryCode,
      required this.password})
      : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context: context);
    double screenWidth = screenSize.getScreenWidth();
    bool isTablet = screenSize.isTablet();
    bool isFullScreen = screenSize.isFullScreen();
    double generalWidth = isFullScreen
        ? screenWidth / 4
        : isTablet
        ? screenWidth / 3
        : screenWidth - 50;

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "AkikFlix",
              style: TextStyle(
                  fontFamily: 'Lobster', fontSize: 40, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: generalWidth,
              child: TextFormField(
                cursorColor: Colors.grey,
                cursorWidth: 0.5,
                maxLength: 6,
                keyboardType: TextInputType.text,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Code",
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 13,right: 13),
                  isDense: true,
                  hintStyle: const TextStyle(fontFamily: "Ysabeau",fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    gapPadding: 20,
                  ),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: generalWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage())),
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(color: Colors.white)),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ysabeau"),
                        ),
                      )),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontFamily: "Ysabeau"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
