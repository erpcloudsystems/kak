import 'package:flutter_google_places/flutter_google_places.dart' as loc;
import 'package:google_api_headers/google_api_headers.dart' as header;
import 'package:google_maps_webservice/places.dart' as places;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/address_screen.dart';
import '../../../../core/global/api_keys.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class MapSearchButton extends StatefulWidget {
  final GoogleMapController? controller;
  final Function(LatLng location) addMarker;
  const MapSearchButton(
      {super.key, required this.controller, required this.addMarker});

  @override
  State<MapSearchButton> createState() => _MapSearchButtonState();
}

class _MapSearchButtonState extends State<MapSearchButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: DoubleManager.d_10,
      bottom: 33.h,
      child: FloatingActionButton(
        mini: true,
        backgroundColor: ColorsManager.mainColor,
        onPressed: _handleSearch,
        child: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }

  Future<void> _handleSearch() async {
    final String apiKey = ConstantKeys.getMapsApiKey(context);
    await loc.PlacesAutocomplete.show(
            context: context,
            apiKey: apiKey,
            onError: onError,
            mode: loc.Mode.overlay,
            language: 'ar',
            types: [],
            strictbounds: false,
            decoration: InputDecoration(
                hintText: StringsManager.search,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
            components: [places.Component(places.Component.country, 'EG')])
        .then((p) {
      // If the user didn't select any place it will throw a null error
      // in the console but it is a bug in the package.
      if (p != null && p.placeId != null) {
        displayPrediction(p);
      }
    });
  }

  void onError(places.PlacesAutocompleteResponse response) {
    SnackBarUtil().getSnackBar(
        context: context,
        message: response.errorMessage ?? StringsManager.unKnownErrorOccurred,
        color: Colors.red);
  }

  Future<void> displayPrediction(places.Prediction p) async {
    final String apiKey = ConstantKeys.getMapsApiKey(context);
    places.GoogleMapsPlaces selectedPlaces = places.GoogleMapsPlaces(
        apiKey: apiKey,
        apiHeaders: await const header.GoogleApiHeaders().getHeaders());

    places.PlacesDetailsResponse detail =
        await selectedPlaces.getDetailsByPlaceId(p.placeId!);

// detail will get place details that user chose from Prediction search
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    setState(() {
      widget.addMarker(LatLng(lat, lng));
      widget.controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, lng),
            zoom: cameraZoom,
          ),
        ),
      );
    });
  }
}
