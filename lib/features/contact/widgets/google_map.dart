import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomMarker();
    super.initState();
  }

  void addCustomMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(75, 75)), EImages.logo)
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  final LatLng _center = const LatLng(30.4461332, -97.7801651);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var markers = {
      Marker(
          markerId: const MarkerId('RDE'), position: _center, icon: markerIcon),
      // markerId: const MarkerId('RDE'),
      // position: _center),
    };

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 12.0,
      ),
      markers: markers,
    );
  }
}




// https://www.google.com/maps/place/Red+Dot+Entertainment/@30.4461332,-97.7801651,17z/data=!3m1!4b1!4m6!3m5!1s0x8644cdb4ec6c31af:0xb5c6b900828980c6!8m2!3d30.4461332!4d-97.7801651!16s%2Fg%2F11vz8kqqdj?entry=ttu

