import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:red_dot_entertainment/features/contact/widgets/google_map.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // body: GoogleMap(
        GoogleMap(
      // mapType: MapType.hybrid,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
    //   floatingActionButton: FloatingActionButton.extended(
    //     onPressed: _goToTheLake,
    //     label: const Text('To the lake!'),
    //     icon: const Icon(Icons.directions_boat),
    //   ),
    // );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double height = EDeviceUtils.getScreenHeight();
    // double width = EDeviceUtils.getScreenWidth();
    final PageController controller = PageController();

    return const Stack(
      children: [
        /// --- IMAGE --- ///
        Positioned(
            top: 0,
            bottom: 0,
            right: 40,
            child: SizedBox(height: 500, width: 500, child: GoogleMapWidget())),
      ],
    );
  }
}
