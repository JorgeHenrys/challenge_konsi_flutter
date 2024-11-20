import 'package:flutter/cupertino.dart';

class ChallengeKonsiIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const ChallengeKonsiIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      color: color,
      fit: BoxFit.contain,
      height: size ?? 24.0,
      width: size ?? 24.0,
    );
  }
}
