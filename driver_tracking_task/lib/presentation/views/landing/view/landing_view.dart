import 'package:driver_tracking_task/core/base/state/consumer_state_x.dart';
import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:driver_tracking_task/presentation/views/landing/view_model/landing_viewmodel.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _landingViewModel =
    ChangeNotifierProvider.autoDispose((ref) => LandingViewModel());

class LandingView extends ConsumerStatefulWidget {
  const LandingView({super.key});

  @override
  ConsumerStateX<ConsumerStatefulWidget> createState() => _LandingViewState();
}

class _LandingViewState extends ConsumerStateX<LandingView> {
  late LandingViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(_landingViewModel.notifier)..initialize(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavBar(context),
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: viewModel.controller,
          itemCount: viewModel.screens!.length,
          itemBuilder: (context, index) {
            return viewModel.screens![index];
          }),
    );
  }

  SizedBox _bottomNavBar(BuildContext context) {
    return SizedBox(
      height: context.mediaQuerySize.height * 0.15,
      child: FloatingNavbar(
          width: context.mediaQuerySize.width * 0.75,
          borderRadius: 20,
          items: [
            FloatingNavbarItem(icon: Icons.map_outlined),
            FloatingNavbarItem(icon: Icons.person_outline),
            FloatingNavbarItem(icon: Icons.error_outline)
          ],
          currentIndex: viewModel.pageIndex,
          onTap: (index) => viewModel.handlePage(index)),
    );
  }
}
