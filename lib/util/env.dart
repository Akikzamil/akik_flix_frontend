import 'package:flutter_dotenv/flutter_dotenv.dart';
class ENV {
  String? getMainServerIP()=>dotenv.env['URL'];
}