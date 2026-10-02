import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class BTTL_2 extends StatefulWidget{
  const BTTL_2({super.key});

  @override
  _RouteFinderScreenState createState() => _RouteFinderScreenState();
}

class _RouteFinderScreenState extends State<BTTL_2>{

  static const LatLng HCMC = LatLng(10.7769, 106.7009);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  LatLng? _startLatLng;
  LatLng? _endLatLng;

  static final CameraPosition _initialPosition = CameraPosition(
    target: HCMC,
    zoom: 12
    );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied) return;

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _startLatLng = LatLng(position.latitude, position.longitude);
      _addMarker(_startLatLng!, "Xuất phát");
      _moveCamera(_startLatLng!);
      _startController.text = "${position.latitude}, ${position.longitude}";
    });
  }

  void _addMarker(LatLng position, String markerId)
  {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(markerId),
          position: position,
          infoWindow: InfoWindow(title: markerId))
      );
    });
  }

  Future<void> _moveCamera(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> _findRoute() async {
    if (_startController.text.isEmpty || _endController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập cả hai điểm!')),
      );
      return;
    }
    List<String> start = _startController.text.split(',');
    List<String> end = _endController.text.split(',');

    _startLatLng = LatLng(double.parse(start[0].trim()), double.parse(start[1].trim()));
    _endLatLng = LatLng(double.parse(end[0].trim()), double.parse(end[1].trim()));

    String url = "https://router.project-osrm.org/route/v1/walking/${_startLatLng!.longitude},${_startLatLng!.latitude};${_endLatLng!.longitude},${_endLatLng!.latitude}?overview=full&geometries=polyline";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      if (data['code'] == 'Ok' && data['routes'].isNotEmpty) {
        String polylinePoints = data['routes'][0]['geometry'];
        List<LatLng> points = _decodePolyline(polylinePoints);

        setState(() {
          _markers.clear();
          _addMarker(_startLatLng!, "Xuất phát");
          _addMarker(_endLatLng!, "Đích đến");

          _polylines.clear();
          _polylines.add(
            Polyline(
              polylineId: const PolylineId('route'),
              points: points,
              color: Colors.blue,
              width: 5,
            ),
          );
          _moveCamera(_startLatLng!);
        });
      } else {
        print("OSRM Error: ${data['code']}");
      }
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Finder'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _startController,
                  decoration: InputDecoration(
                    labelText: 'Điểm xuất phát (lat, lng)',
                  ),
                ),
                TextField(
                  controller: _endController,
                  decoration: InputDecoration(
                    labelText: 'Điểm đích (lat, lng)',
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _findRoute,
                  child: Text('Tìm đường đi'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              markers: _markers,
              polylines: _polylines,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}