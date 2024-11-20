import 'package:challenge_konsi/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../map.dart';

class AddressReviewPage extends StatefulWidget {
  final AddressEntity addressEntity;

  const AddressReviewPage({
    super.key,
    required this.addressEntity,
  });

  @override
  State<AddressReviewPage> createState() => _AddressReviewPageState();
}

class _AddressReviewPageState extends State<AddressReviewPage> {
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController complementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapCubit>(
      create: (context) => injector(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Revisão',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
        body: AddressReviewContent(
          addressEntity: widget.addressEntity,
          zipCodeController: zipCodeController,
          addressController: addressController,
          numberController: numberController,
          complementController: complementController,
        ),
      ),
    );
  }
}
