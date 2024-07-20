import 'package:driver_tracking_task/core/base/model/base_view_model.dart';
import 'package:driver_tracking_task/presentation/views/landing/view/map/view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view/profile/view/profile_view.dart';
import '../view/ticket/view/ticket_view.dart';

class LandingViewModel extends BaseViewModel {
  final List _screens = [
    const MapView(),
    const ProfileView(),
    const TicketView()
  ];
  List? get screens => _screens;
  int _pageIndex = 0;
  int? get pageIndex => _pageIndex;
  final PageController controller = PageController();
  void initialize(BuildContext context) {
    if (mounted) return;
    this.context = context;
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
    notifyListeners();
  }

  void handlePage(int index) {
    _pageIndex = index;
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    notifyListeners();
  }
}
