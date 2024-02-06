import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_project/auth/secrets.dart';
import 'package:responsive_project/services/error_handler.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyServices extends SpotifySdk {
  static Future<void> connectToSpotifyRemote() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: clientId,
        redirectUrl: redirectUrl,
      );

      if (result == true) {
        await SpotifySdk.play(spotifyUri: 'spotify:track:$trackId');

        Fluttertoast.showToast(
            msg: 'Connected to Spotify',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'Failed to connect to Spotify',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      handleError(e, 'connectToSpotifyRemote');
    }
  }

  static Future<void> resume() async {
    try {
      await SpotifySdk.resume();
    } catch (e) {
      handleError(e, 'play');
    }
  }

  static Future<void> pause() async {
    try {
      await SpotifySdk.pause();
    } catch (e) {
      handleError(e, 'pause');
    }
  }
}
