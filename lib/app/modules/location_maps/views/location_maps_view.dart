import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';

import '../../widgets/buttons/buttons.dart';
import '../controllers/location_maps_controller.dart';

class LocationMapsView extends GetView<LocationMapsController> {
  const LocationMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.titleBar),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 64,
        leading: IconButton.filled(
          iconSize: 24,
          style: FilledButton.styleFrom(
            backgroundColor: theme.colorScheme.surface,
          ),
          onPressed: Get.back,
          icon: const BackButtonIcon(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FlutterMap(
        mapController: controller.mapC,
        options: MapOptions(
          initialCenter: controller.initialCenter,
          initialZoom: controller.zoom,
          backgroundColor: theme.colorScheme.surface,
        ),
        children: [
          TileLayer(
            // Display map tiles from any source
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
            userAgentPackageName: 'com.jaga.assistHadir',
            // And many more recommended properties!
          ),
          Obx(
            () => Stack(
              children: [
                if (controller.position.value != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: controller.position.value!,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage(ConstantsAssets.imgNoPhoto),
                        ),
                      ),
                    ],
                  ),
                Visibility(
                  visible: controller.clinicPosition != null,
                  child: CircleLayer(
                    circles: [
                      CircleMarker(
                        point: controller.clinicPosition!,
                        radius: controller.radius,
                        useRadiusInMeter: true,
                        color: const Color.fromRGBO(50, 158, 216, 0.16),
                        borderColor: const Color(0xFF329ED8),
                        borderStrokeWidth: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // RichAttributionWidget(
          //   // Include a stylish prebuilt attribution widget that meets all requirments
          //   attributions: [
          //     TextSourceAttribution(
          //       'OpenStreetMap contributors',
          //       onTap: () {},
          //       // onTap: () => launchUrl(Uri.parse(
          //       //     'https://openstreetmap.org/copyright')), // (external)
          //     ),
          //     // Also add images...
          //   ],p
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Obx(
                () {
                  return Buttons.filled(
                    width: double.infinity,
                    state: controller.position.value == null,
                    onPressed: controller.position.value != null
                        ? controller.checkIn
                        : null,
                    child: const Text('Selanjutnya'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
