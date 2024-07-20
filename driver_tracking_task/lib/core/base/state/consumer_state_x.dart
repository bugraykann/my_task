import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@optionalTypeArgs
abstract class ConsumerStateX<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  ThemeData get theme => context.theme;
  // AppLocalizations get localization => context.localization;
  Size get size => context.mediaQuerySize;
  EdgeInsets get padding => context.padding;
  EdgeInsets get viewPadding => context.viewPadding;
  EdgeInsets get viewInsets => context.viewInsets;
  Orientation get orientation => context.orientation;
  double get devicePixelRatio => context.devicePixelRatio;
  bool get alwaysUse24HourFormat => context.alwaysUse24HourFormat;
}
