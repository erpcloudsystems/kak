import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final Map<String, Marker> _markers = {};
  late GoogleMapController _controller;
  LatLng _currentMapPosition = _kMapCenter;

  static const _kMapCenter = LatLng(30.3917189, 31.4113303);
  static const _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 17, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            markers: _markers.values.toSet(),
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
            onTap: (argument) => addMarker('user choice', argument),
          ),
        ]),
        // TODO: Refactor this code to implement search bar.
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SearchAnchor(
        //       builder: (BuildContext context, SearchController controller) {
        //     return SearchBar(
        //       surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
        //       controller: controller,
        //       padding: const MaterialStatePropertyAll<EdgeInsets>(
        //           EdgeInsets.symmetric(horizontal: 16.0)),
        //       onTap: () => controller.openView(),
        //       onChanged: (_) => controller.openView(),
        //       leading: const Icon(Icons.search),
        //     );
        //   }, suggestionsBuilder: (context, controller) {
        //     return List<ListTile>.generate(5, (index) {
        //       final String item = 'item $index';
        //       return ListTile(
        //         title: Text(item),
        //         onTap: () => setState(() => controller.closeView(item)),
        //       );
        //     });
        //   }),
        // ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    addMarker('test', _currentMapPosition);
  }

  void addMarker(String id, LatLng location) {
    final marker = Marker(markerId: MarkerId(id), position: location);
    _markers[id] = marker;
    setState(() {});
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
    setState(() {});
  }
}
