import 'package:akik_drive_frontend/util/env.dart';

class VideoUtil{
  String getVideeoPath(String videoPath)=> "${ENV().getVideoServerIP()}/$videoPath";
}