import 'dart:io';

import 'package:responsive_project/core/error_handler.dart';

class CheckConnection {
  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      handleError('Couldn\'t connect to internet', 'checkConnection', _);
      return false;
    }
  }
}
