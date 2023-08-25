import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_backgroud.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    //cambiar luego a .network para cargar desde internet
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(strokeWidth: 2));
          }
          return GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  //VideoPlayer
                  VideoPlayer(controller),
                  //Gradient
                  VideoBackground(),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _CaptionVideo(caption: widget.caption)),
                ],
              ),
            ),
          );
        });
  }
}

class _CaptionVideo extends StatelessWidget {
  final String caption;

  const _CaptionVideo({required this.caption});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final size = MediaQuery.of(context).size;
    //TODO: verificar si hace falta container o solo retornar el sizedbox
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black.withOpacity(0.5),
      child: SizedBox(
        width: size.width * 0.8,
        // height: size.height,
        child: Text(caption, style: titleStyle),
      ),
    );
  }
}
