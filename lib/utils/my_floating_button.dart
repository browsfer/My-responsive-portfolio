import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:responsive_project/auth/secrets.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton>
     {
  

  @override
  void initState() {
    //Activate tooltip by ensureTooltipVisible
    Future.delayed(
      const Duration(seconds: 5),
      () {
        final dynamic tooltip = _toolTipKey.currentState;
        tooltip?.ensureTooltipVisible();
      },
    );
    super.initState();

  }

  //Global key to initialize tooltip
  final GlobalKey _toolTipKey = GlobalKey();

  //Music variables
  String trackId = '6rWblGW0pBcB3uygxBuWZV';
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
              IconButton(
                onPressed: () {
                  setState(() {
                    _showPlayStopButton = false;
                    _isPlaying = true;
                  });
                },
                icon: const Icon(Icons.play_circle_outline_rounded),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
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
