import 'package:akik_drive_frontend/controller/provider/video.provider.dart';
import 'package:akik_drive_frontend/model/video.dart';
import 'package:akik_drive_frontend/page/video.page.dart';
import 'package:akik_drive_frontend/util/video.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Video>> videos = ref.watch(videoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("AkikFlix"),
      ),
      body: videos.when(
          data: (videos) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: videos.length,
                itemBuilder: (context, i) => InkWell(
                  onTap: (){
                  String videoPath =   VideoUtil().getVideeoPath(videos[i].path);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPage(videoPath)));
                  },
                  child: GridTile(
                    child: Container(
                      child: Text(videos[i].name),
                    ),
                  ),
                ),
              ),
          error: (err, st) {
            return Center(child: Text(err.toString()));
          },
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
