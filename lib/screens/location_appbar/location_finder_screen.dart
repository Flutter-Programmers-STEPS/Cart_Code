import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Location_Finder_Appbar_Screen extends StatefulWidget {
  const Location_Finder_Appbar_Screen({Key? key}) : super(key: key);

  @override
  State<Location_Finder_Appbar_Screen> createState() =>
      _Location_Finder_Appbar_ScreenState();
}

class _Location_Finder_Appbar_ScreenState
    extends State<Location_Finder_Appbar_Screen> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.postalCode} ,${place.locality},${place.country}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Enter your area or apartment name',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          leading: BackButton(color: Colors.black),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 11, right: 11),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, right: 0, left: 0, bottom: 7),
              child: Container(
                height: 55,
                width: 360,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 8),
                      child: Icon(
                        size: 30,
                        Icons.search_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Try Kochi, Kaloor West etc...",
                      style: TextStyle(fontSize: 13, fontFamily: "Comfortaa"),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromRGBO(237, 237, 237, 1),
                ),
              ),
              onPressed: _getCurrentPosition,
              child: Row(
                children: [
                  Icon(
                    color: Colors.teal,
                    Icons.location_on,
                    size: 16,
                  ),
                  Text(
                    "Use my current location",
                    style: TextStyle(fontFamily: 'sans', color: Colors.teal),
                  ),
                ],
              ),
            ),
            Divider(),
            Center(
              child: Text(
                '${_currentAddress ?? "Location here"}',
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontFamily: 'sans'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 6),
              child: Text(
                "SAVED ADDRESSES",
                style: TextStyle(color: Colors.grey, fontFamily: 'sans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
