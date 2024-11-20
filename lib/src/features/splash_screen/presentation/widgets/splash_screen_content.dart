import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/core.dart';

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ChallengeKonsiColors.primaryBlue,
        ),
        Center(
          child: SizedBox(
            height: 166.0,
            width: 166.0,
            child: Image.asset('assets/icons/location.gif'),
          ),
        ),
      ],
    );
  }
}
