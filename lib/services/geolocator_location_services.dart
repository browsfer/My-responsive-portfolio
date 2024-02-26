import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationService {
  Future<String> getCurrentCity();
  Future<bool> checkPermission();
}

class GeolocatorLocationService implements LocationService {
  static const String permissionNotGrantedError =
      'Location permission not granted';
  static const String failedToDetermineCityError =
      'Failed to determine city from location data';

  @override
  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }
    }
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<String> getCurrentCity() async {
    try {
      await _checkPermission();
      Position position = await _getCurrentPosition();
      return await _getCityFromPosition(position);
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<void> _checkPermission() async {
    bool permissionGranted = await checkPermission();
    if (!permissionGranted) {
      throw PermissionNotGrantedException(permissionNotGrantedError);
    }
  }

  Future<Position> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> _getCityFromPosition(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isEmpty) {
      throw CityNotFoundException(failedToDetermineCityError);
    }
    String? city = placemarks[0].locality ?? 'Unknown';
    return city;
  }
}

class PermissionNotGrantedException implements Exception {
  final String message;
  PermissionNotGrantedException(this.message);
}

class CityNotFoundException implements Exception {
  final String message;
  CityNotFoundException(this.message);
}
