import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/address_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/error_dialog.dart';
import '../widgets/address_and_button_section.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late LatLng userLocation;
  final Set<Marker> _markers = {};
  late GoogleMapController _controller;
  LatLng _currentMapPosition = const LatLng(0, 0);

  static const _kInitialPosition =
      CameraPosition(target: LatLng(0, 0), zoom: 17, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AddressBloc, AddressState>(
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

              BlocProvider.of<AddressBloc>(context)
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
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: AddressAndButtonSection(),
                  ),
                ]);
            }
          },
        ),
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
    addMarker(_currentMapPosition);
    _controller.animateCamera(CameraUpdate.newLatLngZoom(userLocation, 15.0));

    addMarker(userLocation);
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddressBloc>(context).add(GetCurrentLocationEvent());
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
    BlocProvider.of<AddressBloc>(context)
        .add(GetAddressEvent(coordinates: location));
    setState(() {});
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
    setState(() {});
  }
}
