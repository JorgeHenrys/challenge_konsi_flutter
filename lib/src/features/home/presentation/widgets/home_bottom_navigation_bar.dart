import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: ChallengeKonsiColors.primaryGrey, width: 1)),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: Colors.transparent,
            surfaceTintColor: ChallengeKonsiColors.primaryWhite,
            selectedIndex: state.status.index,
            onDestinationSelected: (int index) {
              BlocProvider.of<HomeCubit>(context)
                  .goToPage(HomeStatus.values[index]);
            },
            destinations: <Widget>[
              NavigationDestination(
                icon: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChallengeKonsiIcon(
                      ChallengeKonsiIcons.mapIcon,
                      color: ChallengeKonsiColors.primaryGreyDark,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Mapa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: ChallengeKonsiColors.primaryGreyDark,
                      ),
                    )
                  ],
                ),
                selectedIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 32,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: ChallengeKonsiColors.primaryBlue
                                .withOpacity(0.2),
                          ),
                        ),
                        const ChallengeKonsiIcon(
                          ChallengeKonsiIcons.mapIcon,
                          color: ChallengeKonsiColors.primaryBlue,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Mapa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: ChallengeKonsiColors.primaryBlue,
                      ),
                    )
                  ],
                ),
                label: "Mapa",
              ),
              NavigationDestination(
                icon: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChallengeKonsiIcon(
                      ChallengeKonsiIcons.passbookIcon,
                      color: ChallengeKonsiColors.primaryGreyDark,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Caderneta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: ChallengeKonsiColors.primaryGreyDark,
                      ),
                    )
                  ],
                ),
                selectedIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 32,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: ChallengeKonsiColors.primaryBlue
                                .withOpacity(0.2),
                          ),
                        ),
                        const ChallengeKonsiIcon(
                          ChallengeKonsiIcons.passbookIcon,
                          color: ChallengeKonsiColors.primaryBlue,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Caderneta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: ChallengeKonsiColors.primaryBlue,
                      ),
                    )
                  ],
                ),
                label: "Caderneta",
              ),
            ],
          ),
        );
      },
    );
  }
}
