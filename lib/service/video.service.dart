import 'package:akik_drive_frontend/constant/api_contant.dart';
import 'package:akik_drive_frontend/model/video.dart';
import 'package:akik_drive_frontend/util/env.dart';
import 'package:akik_drive_frontend/util/shared_preference.dart';
import 'package:http/http.dart' as http;

class VideoService {
 Future<List<Video>> getVideos() async {
    String url = "${ENV().getMainServerIP()!}$videosUrl";
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${SharedPreference.instance.getToken()}'
    });
    List<Video> video = videoFromJson(response.body);
    return video;
  }
}
