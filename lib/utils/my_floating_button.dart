import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:responsive_project/services/spotify_services.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  void initState() {
    super.initState();

    //Activate tooltip by ensureTooltipVisible
    Future.delayed(
      const Duration(seconds: 5),
      () {
        final dynamic tooltip = _toolTipKey.currentState;
        tooltip?.ensureTooltipVisible();
      },
    );
  }

  //Global key to initialize tooltip
  final GlobalKey _toolTipKey = GlobalKey();

  //Music button animation
  bool _showPlayStopButton = false;
  bool _isPlaying = false;

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

              //Play button
              IconButton(
                onPressed: () {
                  SpotifyServices.resume();
                  setState(() {
                    _isPlaying = true;
                  });
                },
                icon: const Icon(Icons.play_circle_outline_rounded),
              ),

              //Pause button
              IconButton(
                onPressed: () {
                  SpotifyServices.pause();
                  setState(() {
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
            message: 'Spotify?🎶',
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
              //Connect to Spotify only if not connected yet, otherwise show play/pause buttons
              onPressed: () async {
                if (!_showPlayStopButton) {
                  await SpotifyServices.connectToSpotifyRemote();
                  setState(() {
                    _isPlaying = true;
                    _showPlayStopButton = true;
                  });
                }
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
