import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../map.dart';

class MapCodesList extends StatelessWidget {
  const MapCodesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 140.0,
          ),
          color: ChallengeKonsiColors.primaryWhite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...state.addressList.map(
                  (e) => Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await BlocProvider.of<MapCubit>(context)
                              .setSelectedAddress();
                        },
                        child: ListTile(
                          title: Text(
                            e.cep,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            BlocProvider.of<MapCubit>(context)
                                .truncateWithEllipsis(
                              "${e.street} - ${e.neighborhood}, ${e.city} - ${e.state}",
                              30,
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          leading: const ChallengeKonsiIcon(
                            ChallengeKonsiIcons.markIcon,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
