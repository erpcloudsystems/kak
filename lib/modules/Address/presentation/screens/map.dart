import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/location/location_bloc.dart';
import '../widgets/map/search_button.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/error_dialog.dart';
import '../widgets/map/address_and_button_section.dart';
import '../../../../core/resources/values_manager.dart';

const double cameraZoom = DoubleManager.d_18;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng userLocation;
  final Set<Marker> _markers = {};
  GoogleMapController? _controller;
  LatLng _currentMapPosition = const LatLng(0, 0);

  static const _kInitialPosition = CameraPosition(
      target: LatLng(0, 0), zoom: cameraZoom, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<LocationBloc, LocationState>(
          listenWhen: (previous, current) =>
              current.getCurrentLocationState !=
              previous.getCurrentLocationState,
          listener: (context, state) {
            if (state.getCurrentLocationState == RequestState.error) {
              showDialog(
                  context: context,
                  builder: (context) => ErrorDialog(
                        errorMessage: state.getCurrentLocationMessage,
                      ));
            }

            if (state.getCurrentLocationState == RequestState.success) {
              userLocation = LatLng(
                state.currentLocationCoordinates.latitude,
                state.currentLocationCoordinates.longitude,
              );

              BlocProvider.of<LocationBloc>(context)
                  .add(GetAddressEvent(coordinates: userLocation));
            }
          },
          buildWhen: (previous, current) =>
              current.getCurrentLocationState !=
              previous.getCurrentLocationState,
          builder: (context, state) {
            switch (state.getCurrentLocationState) {
              case RequestState.error:
                return const SizedBox();

              case RequestState.stable:
                return const SizedBox();

              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());

              case RequestState.success:
                return Stack(children: [
                  GoogleMap(
                    initialCameraPosition: _kInitialPosition,
                    myLocationEnabled: true,
                    markers: _markers,
                    onMapCreated: _onMapCreated,
                    onCameraMove: _onCameraMove,
                    onTap: (argument) => addMarker(argument),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AddressAndButtonSection(mapController: _controller),
                  ),
                  MapSearchButton(
                    addMarker: addMarker,
                    controller: _controller,
                  ),
                ]);
            }
          },
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    addMarker(_currentMapPosition);
    _controller!
        .animateCamera(CameraUpdate.newLatLngZoom(userLocation, cameraZoom));
    addMarker(userLocation);
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(GetCurrentLocationEvent());
  }

  void addMarker(LatLng location) {
    MarkerId markerId = const MarkerId('user_marker');
    _markers.removeWhere((marker) => marker.markerId == markerId);
    final marker = Marker(
      markerId: markerId,
      position: location,
      infoWindow: InfoWindow(title: location.longitude.toString()),
    );
    _markers.add(marker);
    BlocProvider.of<LocationBloc>(context)
        .add(GetAddressEvent(coordinates: location));
    setState(() {});
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
    setState(() {});
  }
}
