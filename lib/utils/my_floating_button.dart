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
  //When app is in background, music is paused
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      player.pause();
      _showPlayStopButton = false;
      _isPlaying = false;
    }
    super.didChangeAppLifecycleState(state);
  }

  //Global key to initialize tooltip
  final GlobalKey _toolTipKey = GlobalKey();

  //Music variables
  final player = AudioPlayer();
  String trackId = '6rWblGW0pBcB3uygxBuWZV';
  //Music button animation
  bool _showPlayStopButton = false;
  bool _isPlaying = false;

  @override
  void initState() {
    //Activate tooltip by ensureTooltipVisible
    Future.delayed(
      Duration.zero,
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
        String? trackName = track.name;
        if (trackName != null) {
          final yt = YoutubeExplode();

          final result = await yt.search(trackName);
          final videoId = result.first.id.value;
          var manifest = await yt.videos.streamsClient.getManifest(videoId);

          var audioUrl = manifest.audioOnly.first.url;
          await player.setSourceUrl(audioUrl.toString());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_showPlayStopButton)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //
              //Two buttons to control music
              IconButton(
                onPressed: () {
                  setState(() {
                    player.resume();
                    _showPlayStopButton = false;
                    _isPlaying = true;
                  });
                },
                icon: const Icon(Icons.play_circle_outline_rounded),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    player.pause();
                    _showPlayStopButton = false;
                    _isPlaying = false;
                  });
                },
                icon: const Icon(Icons.pause),
              ),
            ],
          )
        else
          const SizedBox(height: 0),
        Align(
          alignment: Alignment.bottomRight,
          child: Tooltip(
            key: _toolTipKey,
            message: 'Let\'s dance?',
            preferBelow: false,
            showDuration: const Duration(seconds: 4),
            // textAlign: TextAlign.start,

            //TOOLTIP STYLE
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.onBackground),
            triggerMode: TooltipTriggerMode.manual,
            child: FloatingActionButton(
              //
              //TURN ON/OFF MUSIC
              onPressed: () {
                setState(() {
                  _showPlayStopButton = !_showPlayStopButton;
                });
              },

              //MUSIC BUTTON ANIMATION
              child: Lottie.asset(
                'assets/floating_music_button_animation.json',
                animate: _isPlaying ? true : false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
