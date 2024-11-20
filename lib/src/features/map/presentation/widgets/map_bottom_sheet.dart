import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../map.dart';

class MapsBottomSheet extends StatelessWidget {
  final TextEditingController searchController;
  const MapsBottomSheet({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state.searchStatus != MapSearchStatus.success) {
          return const SizedBox();
        }

        return Container(
          height: 240,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 24,
          ),
          decoration: const BoxDecoration(
            color: ChallengeKonsiColors.primaryWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.selectedAddress.cep,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                  color: ChallengeKonsiColors.primaryBlack,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '${state.selectedAddress.street} - ${state.selectedAddress.neighborhood}, ${state.selectedAddress.city} - ${state.selectedAddress.state}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: ChallengeKonsiColors.primaryLightBlack,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ChallengeKonsiPrimaryButton(
                  text: 'Salvar endereço',
                  onPressed: () async {
                    searchController.clear();
                    await BlocProvider.of<MapCubit>(context).closeBottomSheet();

                    await Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return AddressReviewPage(
                            addressEntity: state.selectedAddress,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        );
      },
    );
  }
}
