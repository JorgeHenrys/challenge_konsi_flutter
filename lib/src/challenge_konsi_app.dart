import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/splash_screen/splash_screen.dart';

class ChallengeKonsiApp extends StatelessWidget {
  const ChallengeKonsiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Challenge Konsi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mulish',
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenPage(),
    );
  }
}
