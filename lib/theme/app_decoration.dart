import 'package:flutter/material.dart';
import 'package:khushal_s_application4/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange200,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static BoxDecoration get fillPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

  // Gradient decorations
  static BoxDecoration get gradientPrimaryContainerToPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(0),
            theme.colorScheme.primaryContainer.withOpacity(1),
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlueGrayF => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray6000f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimaryContainer,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
