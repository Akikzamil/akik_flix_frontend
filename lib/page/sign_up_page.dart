import 'package:akik_drive_frontend/util/screen_size.dart';
import 'package:akik_drive_frontend/util/validation.dart';
import 'package:akik_drive_frontend/page/otp_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isObscured = false;
  String password1 = "";
  String password2 = "";
  String phoneNumber = "";
  String countryCode = "";
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
    int flex = 2;

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
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CountryCodePicker(
                        onChanged: (v) => countryCode = v.dialCode!,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'BD',
                        favorite: ['+880', 'BD'],
                        textStyle: const TextStyle(
                            fontFamily: "Ysabeau", color: Colors.white),
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        backgroundColor: Colors.amber,
                        boxDecoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.7)),
                        barrierColor: Colors.transparent,
                        dialogBackgroundColor: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Expanded(
                      flex: flex,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        cursorWidth: 0.5,
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (v) => phoneNumber = v,
                        validator: (value) =>
                            Validation(value!).validatePhoneNumber(),
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 13,right: 13),
                            hintStyle: const TextStyle(fontFamily: "Ysabeau",fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              gapPadding: 20,
                            ),
                            filled: true,
                            isDense: true
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: generalWidth,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: flex,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        cursorWidth: 0.5,
                        obscureText: !isObscured,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (v) => password1 = v,
                        validator: (v) =>
                            Validation(v!).validatePasswords(password2!),
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 15,bottom: 15,left: 13,right: 13),
                          isDense: true,
                          hintStyle: const TextStyle(fontFamily: "Ysabeau",fontSize: 12),
                          suffixIcon: IconButton(
                            icon: Icon(isObscured
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: () =>
                                setState(() => isObscured = !isObscured),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            gapPadding: 20,
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: generalWidth,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: flex,
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        cursorWidth: 0.5,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        onChanged: (v) => password2 = v,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (v) =>
                            Validation(v!).validatePasswords(password1!),
                        decoration: InputDecoration(
                          hintText: "Retype Password",
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: generalWidth,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                        flex: flex,
                        child: Row(
                          children: [
                            Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage())),
                                  style: TextButton.styleFrom(
                                      textStyle:
                                          const TextStyle(color: Colors.white)),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Ysabeau"),
                                  ),
                                )),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => OtpPage(
                                              countryCode: countryCode,
                                              password: password1,
                                              phoneNumber: phoneNumber,
                                            ))),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                child: const Text(
                                  "Get Otp",
                                  style: TextStyle(
                                      color: Colors.lightGreenAccent,
                                      fontFamily: "Ysabeau"),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
