import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core.dart';

class ChallengeKonsiBaseInput extends StatelessWidget {
  final String label;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int maxLines;
  final bool disabled;
  final bool loading;
  final Function()? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const ChallengeKonsiBaseInput({
    super.key,
    required this.label,
    this.autovalidateMode,
    this.keyboardType,
    this.initialValue,
    this.maxLength,
    this.maxLines = 1,
    this.prefixIcon,
    this.onTapOutside,
    this.suffixIcon,
    this.helperText,
    this.errorText,
    this.validator,
    this.onTap,
    this.onChanged,
    this.inputFormatters,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.disabled = false,
    this.loading = false,
    this.controller,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    bool inputEnabled = (!disabled && !loading);

    Widget loadingIcon() {
      double padding = 12;
      return SizedBox(
        width: 8,
        height: 8,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: const CircularProgressIndicator(
            color: ChallengeKonsiColors.primaryGreyDark,
            strokeWidth: 2,
          ),
        ),
      );
    }

    return SizedBox(
      width: double.maxFinite,
      height: 56.0,
      child: TextFormField(
        key: key,
        keyboardType: keyboardType,
        autovalidateMode: autovalidateMode,
        textAlignVertical: TextAlignVertical.center,
        onTapOutside: onTapOutside,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        initialValue: initialValue,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines,
        validator: validator,
        style: const TextStyle(fontSize: 14),
        onTap: onTap,
        onChanged: onChanged,
        enabled: inputEnabled,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: ChallengeKonsiColors.primaryGreyDark,
          ),
          helperMaxLines: 5,
          errorMaxLines: 5,
          isDense: true,
          contentPadding: const EdgeInsets.all(18),
          prefixIcon: prefixIcon,
          suffixIcon: loading ? loadingIcon() : suffixIcon,
          helperText: helperText,
          errorText: errorText,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: ChallengeKonsiColors.primaryGreyDark,
              width: 1,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ChallengeKonsiColors.primaryGreyDark,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ChallengeKonsiColors.primaryRed,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ChallengeKonsiColors.primaryBlue,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
