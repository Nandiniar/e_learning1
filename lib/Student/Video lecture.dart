import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Videolecture extends StatefulWidget {
  @override
  _VideolectureState createState() => _VideolectureState();
}

class _VideolectureState extends State<Videolecture> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'https://rr2---sn-5hne6nzd.googlevideo.com/videoplayback?expire=1703206724&ei=5IqEZYixEKCD6dsPioSsuAQ&ip=212.102.57.81&id=o-AOxfSGiSgS8e5hrbwAlKp3mDGylJXmhqM8sxpGAAGQe7&itag=17&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&spc=UWF9f3HeAbK0-MsNDV68tcoZ7uaXAzk&vprv=1&svpuc=1&mime=video%2F3gpp&gir=yes&clen=20240344&dur=1946.343&lmt=1622905740518496&fexp=24007246&c=ANDROID&txp=5311224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AJfQdSswRQIgeCyOzXTJrpt7mWn-lh9d3UWNqowR1Ct8gXVRcZWOPywCIQCSgUJftz-WeChiCSNVv28g7oxHAoO4HECNUs5mzDo3WA%3D%3D&rm=sn-n02xgoxufvg3-2gbs7e&req_id=5b6f7d737ebaa3ee&redirect_counter=2&cm2rm=sn-4g5edz7l&cms_redirect=yes&cmsv=e&mh=wQ&mip=139.5.197.147&mm=34&mn=sn-5hne6nzd&ms=ltu&mt=1703184574&mv=D&mvi=2&pl=0&lsparams=mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AAO5W4owRQIhALd_yq8giIwbrumz8SX_P-S7R187E2MS83Bxu1hMaSkoAiA2EBYBRW5Zwc3klgf9w5CNoocCNVLBU2avAw9ve9HOXg%3D%3D',
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9, // Adjust according to your video's aspect ratio
      autoPlay: true,
      looping: false, // Set to true if you want the video to loop
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video lectures'),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
