import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/header_card.dart';
import '../../../shared/widgets/universal/theme_showcase.dart';

class ThemedTimePickerDialog extends StatelessWidget {
  const ThemedTimePickerDialog(
      {Key? key, required this.isOpen, required this.onTap})
      : super(key: key);
  final bool isOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeaderCard(
      isOpen: isOpen,
      onTap: onTap,
      title: const Text('Themed TimePickerDialog'),
      child: const TimePickerDialogShowcase(),
    );
  }
}