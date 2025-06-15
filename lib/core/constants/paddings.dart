import 'package:flutter/material.dart';

import 'sizes.dart';

class AppPaddings {
  static const EdgeInsets small = EdgeInsets.all(AppSizes.small);
  static const EdgeInsets medium = EdgeInsets.all(AppSizes.medium);
  static const EdgeInsets large = EdgeInsets.all(AppSizes.large);
  static const EdgeInsets horizontalSmall =
      EdgeInsets.symmetric(horizontal: AppSizes.small);
  static const EdgeInsets horizontalMedium =
      EdgeInsets.symmetric(horizontal: AppSizes.medium);
  static const EdgeInsets horizontalLarge =
      EdgeInsets.symmetric(horizontal: AppSizes.large);
  static const EdgeInsets verticalSmall =
      EdgeInsets.symmetric(vertical: AppSizes.small);
  static const EdgeInsets verticalMedium =
      EdgeInsets.symmetric(vertical: AppSizes.medium);
  static const EdgeInsets verticalLarge =
      EdgeInsets.symmetric(vertical: AppSizes.large);
}
