import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../map/map.dart';
import '../../../passbook/passbook.dart';
import '../../home.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.mapPage:
            return const Scaffold(
              body: MapPage(),
              bottomNavigationBar: HomeBottomNavigationBar(),
            );
          case HomeStatus.passbookPage:
            return const SizedBox(
              child: Scaffold(
                body: PassbookPage(),
                bottomNavigationBar: HomeBottomNavigationBar(),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
