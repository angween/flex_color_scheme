import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/use_material3_text_theme.dart';
import '../../shared/use_tinted_text_theme.dart';

class PrimaryTextThemeSettings extends StatelessWidget {
  const PrimaryTextThemeSettings(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        UseMaterial3TextTheme(controller: controller),
        UseTinted3TextTheme(controller: controller),
        SwitchListTile(
          title: const Text("Use the application's font Noto Sans"),
          subtitle: const Text('You can turn OFF using any app font definition '
              'here to see what the TextTheme looks like on each platform with '
              'its default. This is an app toggle, not a FlexColorScheme '
              'theming toggle.'),
          value: controller.useAppFont,
          onChanged: controller.setUseAppFont,
        ),
        SizedBox(
          width: double.infinity,
          child: Material(
            type: MaterialType.card,
            color: Theme.of(context).colorScheme.primary,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryTextThemeShowcase(),
            ),
          ),
        ),
      ],
    );
  }
}
