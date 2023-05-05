import 'package:akik_drive_frontend/model/video.dart';
import 'package:akik_drive_frontend/service/video.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoProvider extends StateNotifier<AsyncValue<List<Video>>> {
  VideoProvider(super.state) {
    init();
  }

  init() async {
    state = const AsyncValue.loading();
    try {
      List<Video> videos = await VideoService().getVideos();
      state = AsyncValue.data(videos);
    } catch (e, stacktrace) {
      state = AsyncValue.error(e, stacktrace);
    }
  }
}

final videoProvider =
    StateNotifierProvider<VideoProvider, AsyncValue<List<Video>>>(
        (ref) => VideoProvider(const AsyncValue.loading()));
