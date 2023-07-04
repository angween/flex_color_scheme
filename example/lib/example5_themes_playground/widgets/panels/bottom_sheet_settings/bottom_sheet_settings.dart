import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BottomSheetSettings extends StatelessWidget {
  const BottomSheetSettings(this.controller, {super.key});

  final ThemeController controller;

  static final Uri _fcsFlutterIssue108539 = Uri(
    scheme: 'https',
    host: 'github.com',
    path: 'flutter/flutter/issues/108539',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isDark = theme.brightness == Brightness.dark;
    final TextStyle spanTextStyle = theme.textTheme.bodySmall!;
    final TextStyle linkStyle = theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);

    final String snackDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (light primary, 93% opacity)'
            : useMaterial3
                ? 'default (inverseSurface)'
                : 'default (onSurface)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (dark primary, 95% opacity)'
            : useMaterial3
                ? 'default (inverseSurface)'
                : 'default (onSurface.op80%, alphaBlend surface)';

    final String snackActionDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (inversePrimary)'
            : useMaterial3
                ? 'default (inversePrimary)'
                : 'default (secondary)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (inversePrimary)'
            : useMaterial3
                ? 'default (inversePrimary)'
                : 'default (secondary)';

    final String sheetDefaultColorLabel =
        controller.useSubThemes && controller.useFlexColorScheme
            ? 'default (surface)'
            : useMaterial3
                ? 'default (surface)'
                : 'default (theme.canvasColor)';
    final String sheetElevationDefaultLabel =
        controller.bottomSheetElevation == null
            ? useMaterial3
                ? 'default 1'
                : 'default 4'
            : '';
    final String sheetModalElevationDefaultLabel =
        controller.bottomSheetModalElevation == null
            ? useMaterial3
                ? 'default 2'
                : 'default 8'
            : '';

    // Get effective platform default global radius.
    final double? effectiveRadius = App.effectiveRadius(controller);
    final String sheetRadiusDefaultLabel = controller.bottomSheetBorderRadius ==
                null &&
            effectiveRadius == null
        ? 'default 28'
        : controller.bottomSheetBorderRadius == null && effectiveRadius != null
            ? 'global ${effectiveRadius.toStringAsFixed(0)}'
            : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        const ListTileReveal(
          title: Text('BottomSheet'),
          subtitleDense: true,
          subtitle: Text('The BottomSheet comes in two variants, normal and '
              'modal version. Some of their properties can be themed '
              'individually, but not all of them. The border radius only has '
              'one the property shared by both variants.\n'),
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Border radius'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetBorderRadius == null ||
                        (controller.bottomSheetBorderRadius ?? -1) < 0
                    ? sheetRadiusDefaultLabel
                    : (controller.bottomSheetBorderRadius?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 28'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetBorderRadius(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomSheetBorderRadius == null ||
                              (controller.bottomSheetBorderRadius ?? -1) < 0
                          ? sheetRadiusDefaultLabel
                          : (controller.bottomSheetBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 28'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const ListTile(title: Text('Standard BottomSheet')),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation == null ||
                        (controller.bottomSheetElevation ?? -1) < 0
                    ? sheetElevationDefaultLabel
                    : (controller.bottomSheetElevation?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomSheetElevation == null ||
                              (controller.bottomSheetElevation ?? -1) < 0
                          ? sheetElevationDefaultLabel
                          : (controller.bottomSheetElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: sheetDefaultColorLabel,
          index: controller.bottomSheetSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomSheetSchemeColor(null);
                  } else {
                    controller
                        .setBottomSheetSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetShowcase(),
        ),
        const ListTile(title: Text('Modal BottomSheet')),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetModalElevation == null ||
                        (controller.bottomSheetModalElevation ?? -1) < 0
                    ? sheetModalElevationDefaultLabel
                    : (controller.bottomSheetModalElevation
                            ?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetModalElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetModalElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomSheetModalElevation == null ||
                              (controller.bottomSheetModalElevation ?? -1) < 0
                          ? sheetModalElevationDefaultLabel
                          : (controller.bottomSheetModalElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Background color'),
          labelForDefault: sheetDefaultColorLabel,
          index: controller.bottomSheetModalSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomSheetModalSchemeColor(null);
                  } else {
                    controller.setBottomSheetModalSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetModalShowcase(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}