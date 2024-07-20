import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SpaceSizedWidthBox extends StatelessWidget {
  const SpaceSizedWidthBox({
    required this.width,
    super.key,
  });
  final double width;
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: context.mediaQuerySize.width * width);
}
