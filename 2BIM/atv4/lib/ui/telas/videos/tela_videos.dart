import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes/dados/modelos/videos_filme.dart';
import 'package:pod_player/pod_player.dart';

import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/tema/tema.dart';

@RoutePage(name: 'TelaVideosRoute')
class TelaVideos extends ConsumerStatefulWidget {
  final VideoFilme movieVideo;

  const TelaVideos(this.movieVideo, {super.key});

  @override
  ConsumerState<TelaVideos> createState() => _VideoPageState();
}

class _VideoPageState extends ConsumerState<TelaVideos> {
  late final PodPlayerController podPlayerController;

  @override
  void initState() {
    super.initState();
    final playVideoFrom = PlayVideoFrom.youtube(
        youtubeUrlFromId(widget.movieVideo.key),
    );
    podPlayerController = PodPlayerController(
        playVideoFrom: playVideoFrom,
        podPlayerConfig: const PodPlayerConfig(autoPlay: false))
      ..initialise();
  }

  @override
  void dispose() {
    podPlayerController.dispose();
    super.dispose();
  }

  Widget getVideoPlayer(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fundoTela,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            context.router.maybePop();
          },
        ),
        centerTitle: false,
        title: Text('Back',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: fundoTela,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PodVideoPlayer(
                  controller: podPlayerController,
                  matchVideoAspectRatioToFrame: true,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return getVideoPlayer(context);
  }
}
