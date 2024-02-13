import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:responsive_project/services/spotify_services.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  final GlobalKey _toolTipKey = GlobalKey();
  bool _showPlayStopButton = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _showTooltip();
  }

  void _showTooltip() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        final dynamic tooltip = _toolTipKey.currentState;
        tooltip?.ensureTooltipVisible();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: _showPlayStopButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () async {
                  await SpotifyServices.resume();
                  setState(() {
                    _isPlaying = true;
                  });
                },
                icon: const Icon(Icons.play_circle_outline_rounded),
              ),
              IconButton(
                onPressed: () async {
                  await SpotifyServices.pause();
                  setState(() {
                    _isPlaying = false;
                  });
                },
                icon: const Icon(Icons.pause),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Tooltip(
            key: _toolTipKey,
            message: 'Spotify?🎶',
            preferBelow: false,
            showDuration: const Duration(seconds: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.onBackground),
            triggerMode: TooltipTriggerMode.manual,
            child: FloatingActionButton(
              onPressed: () async {
                if (!_showPlayStopButton) {
                  await SpotifyServices.connectToSpotifyRemote();
                  setState(() {
                    _isPlaying = true;
                    _showPlayStopButton = true;
                  });
                }
              },
              child: Lottie.asset(
                'assets/floating_music_button_animation.json',
                animate: _isPlaying,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
