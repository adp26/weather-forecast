import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationAPI {
  Position? _locationData;
  String location = 'Unknown';

  Future<String> nameLocation() async {
    if (_locationData != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _locationData!.latitude, _locationData!.longitude);
      // String strStreet = placemarks[0].street!.split(placemarks[0].subLocality.toString())[0];

      location = "${placemarks[0].subLocality}";
    }
    return location;
  }

  Future<Position?> coordinateLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } else {
      permission = await Geolocator.checkPermission();
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _locationData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return _locationData;
  }
}
