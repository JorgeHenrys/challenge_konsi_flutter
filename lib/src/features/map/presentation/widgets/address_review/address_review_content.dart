import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../map.dart';

class AddressReviewContent extends StatelessWidget {
  final AddressEntity addressEntity;
  final TextEditingController zipCodeController;
  final TextEditingController addressController;
  final TextEditingController numberController;
  final TextEditingController complementController;

  const AddressReviewContent({
    super.key,
    required this.addressEntity,
    required this.zipCodeController,
    required this.addressController,
    required this.numberController,
    required this.complementController,
  });

  @override
  Widget build(BuildContext context) {
    addressController.text =
        '${addressEntity.street} - ${addressEntity.neighborhood}, ${addressEntity.city} - ${addressEntity.state}';
    zipCodeController.text = addressEntity.cep;

    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ChallengeKonsiBaseInput(
              label: 'CEP',
              controller: zipCodeController,
              disabled: true,
            ),
            const SizedBox(
              height: 24.0,
            ),
            ChallengeKonsiBaseInput(
              label: 'Endereço',
              controller: addressController,
              disabled: true,
            ),
            const SizedBox(
              height: 24.0,
            ),
            ChallengeKonsiBaseInput(
              label: 'Número',
              controller: numberController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24.0,
            ),
            ChallengeKonsiBaseInput(
              label: 'Complemento',
              controller: complementController,
            ),
            SizedBox(
              height: height * 0.4,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ChallengeKonsiPrimaryButton(
                onPressed: () async {
                  if (numberController.text.isNotEmpty) {
                    addressEntity.copyWith(number: numberController.text);
                  }
                  if (complementController.text.isNotEmpty) {
                    addressEntity.copyWith(
                        complement: complementController.text);
                  }

                  await BlocProvider.of<MapCubit>(context)
                      .saveAddressAtList(addressEntity);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                text: 'Confirmar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
