import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

void handleError(dynamic e, String methodName) {
  if (e is PlatformException) {
    _logger.e('$methodName - PlatformException: ${e.message}');
    Fluttertoast.showToast(
        msg: e.message ?? 'An error occurred',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw e;
  } else if (e is MissingPluginException) {
    _logger.w('$methodName - MissingPluginException: not implemented');
  } else {
    _logger.e('$methodName - Unexpected error: $e');
  }
}
