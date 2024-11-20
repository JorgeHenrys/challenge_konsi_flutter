import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../passbook.dart';

class PassbookContent extends StatelessWidget {
  const PassbookContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PassbookSavedAddress(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 60.0,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: ChallengeKonsiSearchInput(
              //searchController: searchController,
              hintText: 'Buscar',
              onChanged: (e) async {
                // await BlocProvider.of<MapCubit>(context)
                //     .changeSearchText(e);
              },
            ),
          ),
        ),
      ],
    );
  }
}
