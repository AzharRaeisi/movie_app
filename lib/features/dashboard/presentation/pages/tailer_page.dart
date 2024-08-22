import 'package:flutter/material.dart';
import 'package:movie_app/features/dashboard/presentation/widgets/custom_appbar.dart';
import 'package:movie_app/shared/theme/app_colors.dart';
import 'package:movie_app/shared/theme/app_images.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TailerPage extends StatefulWidget {
  const TailerPage({super.key, required this.videoId});
  final String videoId;
  @override
  State<TailerPage> createState() => _TailerPageState();
}

class _TailerPageState extends State<TailerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: SafeArea(
            child: CustomAppbar(
              leftIconPath: Assets.imagesBack,
              onLeftIconTap: () => Navigator.pop(context),
            ),
          )),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
