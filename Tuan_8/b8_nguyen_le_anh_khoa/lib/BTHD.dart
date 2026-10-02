import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BTHD extends StatefulWidget{
  const BTHD({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<BTHD>{
  static const LatLng HCMC = LatLng(10.7769, 106.7009);
  static const LatLng HUIT = LatLng(10.8065, 106.6289);

  static const CameraPosition initialCameraPosition = CameraPosition(target: HCMC,zoom:  13);

  final Set<Marker> _markers = {
    const Marker(
      markerId:MarkerId("HCMC_Marker"),
      position: HCMC ,
      infoWindow: InfoWindow(title: "TP. Hồ Chí Minh", snippet: 'Trung tâm TPHCM')
    ),
    const Marker(
      markerId: MarkerId("HUIT_Marker"),
      position: HUIT,
      infoWindow: InfoWindow(title: "140 Lê Trọng Tấn", snippet: 'Tây Thạnh, TP. HCM')
      )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map TP.HCM"),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        mapType:  MapType.normal,
        zoomControlsEnabled: true,
        compassEnabled: true,
        markers: _markers,
        )
    );
  }
}