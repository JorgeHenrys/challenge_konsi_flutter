import 'package:challenge_konsi/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../map.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapCubit>(
      create: (context) => injector(),
      lazy: false,
      child: Scaffold(
        body: MapContent(
          searchController: searchController,
        ),
        floatingActionButton: const MapFloatingSearchButton(),
        bottomSheet: MapsBottomSheet(
          searchController: searchController,
        ),
      ),
    );
  }
}
