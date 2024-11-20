import 'package:challenge_konsi/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../passbook.dart';

class PassbookPage extends StatefulWidget {
  const PassbookPage({super.key});

  @override
  State<PassbookPage> createState() => _PassbookPageState();
}

class _PassbookPageState extends State<PassbookPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PassbookCubit>(
      create: (context) => injector()..initialize(),
      child: const Scaffold(
        body: PassbookContent(),
      ),
    );
  }
}
