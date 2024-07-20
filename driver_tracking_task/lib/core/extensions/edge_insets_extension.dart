import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsExtension on EdgeInsetsGeometry {
  EdgeInsetsGeometry withStatusBarPadding(BuildContext context) =>
      add(EdgeInsets.only(top: context.padding.top));
  EdgeInsetsGeometry withSystemNavigationBarPadding(BuildContext context) =>
      add(EdgeInsets.only(bottom: context.padding.bottom));
  EdgeInsetsGeometry withBottomViewPadding(BuildContext context) =>
      add(EdgeInsets.only(bottom: context.viewPadding.bottom));
  EdgeInsetsGeometry withViewInsetsPadding(BuildContext context) =>
      add(EdgeInsets.only(bottom: context.viewInsets.bottom));
}
