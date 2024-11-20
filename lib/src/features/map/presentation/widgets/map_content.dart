import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/core.dart';
import '../../map.dart';
import 'map_codes_list.dart';

class MapContent extends StatelessWidget {
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  final TextEditingController searchController;

  final LatLng latLng = const LatLng(-4.05977, -38.49640);
  MapContent({
    super.key,
    required this.searchController,
  });

  Future<void> _moveToDestination(LatLng destination) async {
    final GoogleMapController mapController = await controller.future;

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: destination,
          zoom: 14.4746,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition kGooglePlex = CameraPosition(
      target: latLng,
      zoom: 14.4746,
    );

    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state.searchStatus == MapSearchStatus.success) {
          _moveToDestination(
            LatLng(
              double.parse(state.selectedAddress.location.coordinates.latitude),
              double.parse(
                  state.selectedAddress.location.coordinates.longitude),
            ),
          );
        }

        return Stack(
          children: [
            GoogleMap(
              mapType: MapType.terrain,
              scrollGesturesEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController gMapController) {
                controller.complete(gMapController);
              },
              onTap: (e) async {
                searchController.clear();
                await BlocProvider.of<MapCubit>(context).closeBottomSheet();
              },
              circles: state.searchStatus != MapSearchStatus.success
                  ? {}
                  : {
                      Circle(
                        circleId: const CircleId('currentCircle'),
                        center: LatLng(
                          double.parse(state
                              .selectedAddress.location.coordinates.latitude),
                          double.parse(state
                              .selectedAddress.location.coordinates.longitude),
                        ),
                        radius: 380,
                        fillColor:
                            ChallengeKonsiColors.primaryBlue.withOpacity(0.4),
                        strokeColor:
                            ChallengeKonsiColors.primaryBlue.withOpacity(0.05),
                      ),
                    },
              markers: state.searchStatus != MapSearchStatus.success
                  ? {}
                  : <Marker>{
                      Marker(
                        markerId: const MarkerId('markerId'),
                        position: LatLng(
                          double.parse(state
                              .selectedAddress.location.coordinates.latitude),
                          double.parse(state
                              .selectedAddress.location.coordinates.longitude),
                        ),
                      )
                    },
            ),
            (state.searchText.isNotEmpty &&
                    state.searchStatus != MapSearchStatus.success)
                ? const MapCodesList()
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 60.0,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: ChallengeKonsiSearchInput(
                  searchController: searchController,
                  hintText: 'Buscar',
                  onChanged: (e) async {
                    await BlocProvider.of<MapCubit>(context)
                        .changeSearchText(e);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
