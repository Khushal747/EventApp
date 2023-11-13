import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyLargeGray900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 15.fSize,
      );
  static get bodySmallBluegray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray500,
      );
  // Headline text style
  static get headlineSmallPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  // Title text style
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900.withOpacity(0.65),
      );
  static get titleMediumGray90016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900.withOpacity(0.65),
        fontSize: 16.fSize,
      );
  static get titleMediumGray60010 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600.withOpacity(0.65),
        fontSize: 7.fSize,
      );
  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontSize: 16.fSize,
      );
  static get titleSmallBlack90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
