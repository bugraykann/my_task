import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SpaceSizedHeightBox extends StatelessWidget {
  const SpaceSizedHeightBox({
    required this.height,
    super.key,
  });
  final double height;
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: context.mediaQuerySize.height * height);
}
