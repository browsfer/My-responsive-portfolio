import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_project/auth/secrets.dart';
import 'package:responsive_project/services/error_handler.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyServices extends SpotifySdk {
  static Future<void> _showToast(String message,
      {Color backgroundColor = Colors.green}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<void> connectToSpotifyRemote() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: clientId,
        redirectUrl: redirectUrl,
      );

      if (result == true) {
        await SpotifySdk.play(spotifyUri: 'spotify:track:$trackId');
        await _showToast('Connected to Spotify');
      }
    } catch (e) {
      handleError('Failed to connect to Spotify', 'connectToSpotifyRemote', e);
      await _showToast('Failed to connect to Spotify',
          backgroundColor: Colors.red);
    }
  }

  static Future<void> resume() async {
    try {
      await SpotifySdk.resume();
    } catch (e) {
      handleError('Failed to resume playback', 'resume', e);
      await _showToast('Failed to resume playback',
          backgroundColor: Colors.red);
    }
  }

  static Future<void> pause() async {
    try {
      await SpotifySdk.pause();
    } catch (e) {
      handleError('Failed to pause playback', 'pause', e);
      await _showToast('Failed to pause playback', backgroundColor: Colors.red);
    }
  }
}
