import 'package:flutter/material.dart';

import '../constants/box_value.dart';

extension BoxExtension on BuildContext {
  BoxValues get box => BoxValues(this);
}
