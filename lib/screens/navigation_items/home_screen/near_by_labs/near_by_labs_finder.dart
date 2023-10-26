import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Near_by_Lab_Location extends StatefulWidget {
  const Near_by_Lab_Location({Key? key}) : super(key: key);

  @override
  _Near_by_Lab_LocationState createState() => _Near_by_Lab_LocationState();
}

class _Near_by_Lab_LocationState extends State<Near_by_Lab_Location> {
  // created controller for displaying Google Maps
  Completer<GoogleMapController> _controller = Completer();

  // given camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(9.0598, 76.5356),
    zoom: 15,
  );

  Uint8List? marketimages;
  List<String> images = [
    'assets/images/test/location-pin.png',
    'assets/images/test/location-pin1.png',
    'assets/images/test/location-pin2.png',
  ];

  // created empty list of markers
  final List<Marker> _markers = <Marker>[];

  // created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[
    LatLng(9.0987, 76.5546),
    LatLng(9.0996, 76.5235),
    LatLng(9.1062, 76.5734),
  ];

  // declared method to get Images
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize loadData method
    loadData();
  }

  // created method for displaying custom markers according to index
  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(Marker(
        // given marker id
        markerId: MarkerId(i.toString()),
        // given marker icon
        icon: BitmapDescriptor.fromBytes(markIcons),
        // given position
        position: _latLen[i],
        infoWindow: InfoWindow(
          // given title for marker
          title: 'Lab:' + i.toString(),
        ),
      ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 128, 128, 1.0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // on below line we have given title of app
        title: Text(
          "Nearby lab's",
          style: TextStyle(fontSize: 19, fontFamily: 'sans'),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            // given camera position
            initialCameraPosition: _kGoogle,
            // set markers on google map
            markers: Set<Marker>.of(_markers),
            // on below line we have given map type
            mapType: MapType.normal,
            // on below line we have enabled location
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            // on below line we have enabled compass
            compassEnabled: true,
            // below line displays google map in our app
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
