import 'package:akik_drive_frontend/page/home_page.dart';
import 'package:akik_drive_frontend/page/login_page.dart';
import 'package:akik_drive_frontend/page/sign_up_page.dart';
import 'package:akik_drive_frontend/service/jwt.service.dart';
import 'package:akik_drive_frontend/util/shared_preference.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.instance.init();
  await dotenv.load(fileName: ".env");
  String? token = SharedPreference.instance.getToken();
  bool isTokenValid = token==null?false:await JWTService().isValidJwt();
  runApp(ProviderScope(child: MyApp(isTokenValid)));
}

class MyApp extends StatelessWidget {
  bool isTokenValid;
  MyApp(this.isTokenValid, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: [
        const Locale("af"),
        const Locale("am"),
        const Locale("ar"),
        const Locale("az"),
        const Locale("be"),
        const Locale("bg"),
        const Locale("bn"),
        const Locale("bs"),
        const Locale("ca"),
        const Locale("cs"),
        const Locale("da"),
        const Locale("de"),
        const Locale("el"),
        const Locale("en"),
        const Locale("es"),
        const Locale("et"),
        const Locale("fa"),
        const Locale("fi"),
        const Locale("fr"),
        const Locale("gl"),
        const Locale("ha"),
        const Locale("he"),
        const Locale("hi"),
        const Locale("hr"),
        const Locale("hu"),
        const Locale("hy"),
        const Locale("id"),
        const Locale("is"),
        const Locale("it"),
        const Locale("ja"),
        const Locale("ka"),
        const Locale("kk"),
        const Locale("km"),
        const Locale("ko"),
        const Locale("ku"),
        const Locale("ky"),
        const Locale("lt"),
        const Locale("lv"),
        const Locale("mk"),
        const Locale("ml"),
        const Locale("mn"),
        const Locale("ms"),
        const Locale("nb"),
        const Locale("nl"),
        const Locale("nn"),
        const Locale("no"),
        const Locale("pl"),
        const Locale("ps"),
        const Locale("pt"),
        const Locale("ro"),
        const Locale("ru"),
        const Locale("sd"),
        const Locale("sk"),
        const Locale("sl"),
        const Locale("so"),
        const Locale("sq"),
        const Locale("sr"),
        const Locale("sv"),
        const Locale("ta"),
        const Locale("tg"),
        const Locale("th"),
        const Locale("tk"),
        const Locale("tr"),
        const Locale("tt"),
        const Locale("uk"),
        const Locale("ug"),
        const Locale("ur"),
        const Locale("uz"),
        const Locale("vi"),
        const Locale("zh")
      ],
      localizationsDelegates: [CountryLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: isTokenValid? const HomePage():const LoginPage(),
    );
  }
}
