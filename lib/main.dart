import 'dart:io';

import 'package:flutter/material.dart';

import 'src/challenge_konsi_app.dart';
import 'src/core/core.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  DependencyInjection.initialize();

  runApp(const ChallengeKonsiApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
