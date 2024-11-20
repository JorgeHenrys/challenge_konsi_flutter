import 'package:flutter/material.dart';

import '../../../core.dart';

class ChallengeKonsiSearchInput extends StatelessWidget {
  final TextEditingController? searchController;
  final String hintText;
  final Function(String)? onChanged;
  const ChallengeKonsiSearchInput({
    super.key,
    required this.hintText,
    this.searchController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: ChallengeKonsiColors.primaryGreyDark
                .withOpacity(0.3), // Cor da sombra
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Posição da sombra
          ),
        ],
      ),
      child: SizedBox(
        height: 48,
        width: double.maxFinite,
        child: TextField(
          controller: searchController,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: ChallengeKonsiColors.primaryGreyDark,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ChallengeKonsiColors.primaryGrey,
            hintText: hintText,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(16.0),
              child: ChallengeKonsiIcon(
                ChallengeKonsiIcons.searchIcon,
                color: ChallengeKonsiColors.primaryGreyDark,
              ),
            ),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: ChallengeKonsiColors.primaryGreyDark,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: ChallengeKonsiColors.primaryGrey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ChallengeKonsiColors.primaryGrey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
