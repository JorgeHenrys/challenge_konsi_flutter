import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../map.dart';

class MapFloatingSearchButton extends StatelessWidget {
  const MapFloatingSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state.searchText.isEmpty ||
            state.searchStatus == MapSearchStatus.success) {
          return const SizedBox();
        }
        return FloatingActionButton(
          backgroundColor: ChallengeKonsiColors.primaryBlue,
          onPressed: () async {
            await BlocProvider.of<MapCubit>(context).setSelectedAddress();
          },
          shape: const CircleBorder(),
          child: const ChallengeKonsiIcon(
            ChallengeKonsiIcons.searchIcon,
            color: ChallengeKonsiColors.primaryWhite,
          ),
        );
      },
    );
  }
}
