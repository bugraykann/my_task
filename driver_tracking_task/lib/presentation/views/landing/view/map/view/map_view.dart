import 'package:driver_tracking_task/core/base/state/consumer_state_x.dart';
import 'package:driver_tracking_task/core/constants/dimens.dart';
import 'package:driver_tracking_task/core/extensions/box_extensions.dart';
import 'package:driver_tracking_task/core/extensions/context_extension.dart';
import 'package:driver_tracking_task/presentation/views/landing/view/map/view_model/map_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final _mapViewModel =
    ChangeNotifierProvider.autoDispose((ref) => MapViewModel());

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerStateX<ConsumerStatefulWidget> createState() => _MapViewState();
}

class _MapViewState extends ConsumerStateX<MapView> {
  late MapViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(_mapViewModel.notifier)..initialize(context);
    ref.listen<MapViewModel>(_mapViewModel, (_, position) {
      setState(() {});
    });

    if (viewModel.position == null || viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.75),
          centerTitle: true,
          title: Text(
            'Driver Tracking App',
            style: context.theme.textTheme.bodyLarge
                ?.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            )
          ],
        ),
        extendBody: true,
        body: Stack(
          children: [
            FlutterMap(
                mapController: viewModel.mapController,
                options: MapOptions(
                  keepAlive: true,
                  initialZoom: 15,
                  initialCenter: LatLng(viewModel.position!.latitude,
                      viewModel.position!.longitude),
                ),
                children: [
                  TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c']),
                  if (viewModel.selectedLocation != null)
                    PolylineLayer(polylines: [
                      Polyline(
                        borderStrokeWidth: 3,
                        borderColor: Colors.white,
                        strokeWidth: 5,
                        color: Colors.black,
                        points: [
                          LatLng(viewModel.position!.latitude,
                              viewModel.position!.longitude),
                          LatLng(viewModel.selectedLocation!.latitude,
                              viewModel.selectedLocation!.longitude),
                        ],
                      ),
                    ]),
                  MarkerLayer(markers: buildMarkers()),
                  MarkerLayer(markers: [
                    Marker(
                      width: 30,
                      height: 30,
                      point: LatLng(viewModel.position!.latitude,
                          viewModel.position!.longitude),
                      child: _myLocation(),
                    ),
                  ]),
                ]),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.paddingPageHorizontal * 2,
                  ),
                  height: context.mediaQuerySize.height * 0.2,
                  child: PageView.builder(
                    controller: viewModel.pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    onPageChanged: (v) => viewModel.focusChanged(v),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.paddingPageHorizontal),
                        margin: const EdgeInsets.symmetric(
                            horizontal: Dimens.paddingPageHorizontal),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(
                              Dimens.radiusTile,
                            )),
                        child: Column(
                          children: [
                            context.box.emptySizedHeightBoxLow,
                            Text(
                              'A Company',
                              style: context.theme.textTheme.bodyLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                      text: 'Test Adres\n',
                                      children: [
                                        TextSpan(text: 'Telefon Numarası')
                                      ]),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // viewModel.selectLocation(index);
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Center(
                                            child: Text('Teslimata Başla')),
                                        content: const Text(
                                            'Bu teslimata başlamak istiyor musunuz ?\n"İptal durumunda teslimatı tekrar alamayabilirsiniz".'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('İptal Et')),
                                          TextButton(
                                              onPressed: () {
                                                viewModel
                                                    .fetchRoute(
                                                      LatLng(
                                                          viewModel.position!
                                                              .latitude,
                                                          viewModel.position!
                                                              .longitude),
                                                      locations[index],
                                                    )
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              },
                                              child: const Text('Başla')),
                                        ],
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green.shade300,
                                    child: const Icon(
                                      Icons.play_arrow,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            context.box.emptySizedHeightBoxLow3x,
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () => viewModel.mapController.move(
                    LatLng(viewModel.position!.latitude,
                        viewModel.position!.longitude),
                    15,
                  ),
                  mini: true,
                  backgroundColor: Colors.blue.shade300,
                  child: const Icon(Icons.center_focus_strong),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Container _myLocation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: const Icon(
        Icons.arrow_upward_outlined,
        size: 15,
      ),
    );
  }
}
