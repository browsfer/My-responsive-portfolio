import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_project/auth/secrets.dart';
import 'package:spotify/spotify.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton>
    with WidgetsBindingObserver {
  //Global key to initialize tooltip
  final GlobalKey _toolTipKey = GlobalKey();

  //Music button animation
  bool _isPlaying = false;

  //Music variables
  final player = AudioPlayer();
  String trackId = '6rWblGW0pBcB3uygxBuWZV';

  @override
  void initState() {
    //Activate tooltip by ensureTooltipVisible
    Future.delayed(
      const Duration(seconds: 3),
      () {
        final dynamic tooltip = _toolTipKey.currentState;
        tooltip?.ensureTooltipVisible();
      },
    );

    //Play music
    final credentials = SpotifyApiCredentials(clientId, clientSecret);
    final spotify = SpotifyApi(credentials);
    spotify.tracks.get(trackId).then(
      (track) async {
        String? songName = track.name;
        if (songName != null) {
          final yt = YoutubeExplode();

          final result = await yt.search(songName);
          final videoId = result.first.id.value;
          var manifest = await yt.videos.streamsClient.getManifest(videoId);

          var audioUrl = manifest.audioOnly.first.url;
          await player.setSourceUrl(audioUrl.toString());
        }
        print(player.state);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: _toolTipKey,
      message: 'Let\'s dance?',
      preferBelow: false,
      showDuration: const Duration(seconds: 4),
      textAlign: TextAlign.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onBackground),
      triggerMode: TooltipTriggerMode.manual,
      child: FloatingActionButton(
        //Temporary. Later it will be replaced by turn on/off music button
        onPressed: () {
          setState(() {
            _isPlaying = !_isPlaying;
            if (!_isPlaying) {
              player.pause();
            } else {
              player.resume();
            }
          });
        },
        child: Lottie.asset(
          'assets/floating_music_button_animation.json',
          animate: _isPlaying ? true : false,
        ),
      ),
    );
  }
}
