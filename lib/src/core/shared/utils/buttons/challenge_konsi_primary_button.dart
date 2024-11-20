import 'package:flutter/material.dart';

import '../../../core.dart';

class ChallengeKonsiPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ChallengeKonsiPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ChallengeKonsiColors.primaryBlue, // Fundo azul
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Bordas arredondadas
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 15), // Espaçamento interno
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // Cor do texto
          fontSize: 16, // Tamanho da fonte
          fontWeight: FontWeight.bold, // Peso da fonte
        ),
      ),
    );
  }
}
