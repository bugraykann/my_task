import 'package:driver_tracking_task/core/utils/theme.dart';
import 'package:driver_tracking_task/presentation/views/landing/view/landing_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.primaryTheme,
      title: 'Buğra Aykan',
      home: const LandingView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
