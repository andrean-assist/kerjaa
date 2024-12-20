import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:assist_hadir/app/modules/widgets/modal/custom_modal.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../shared/shared_enum.dart';
import '../modules/widgets/buttons/buttons.dart';
import '../modules/widgets/modal/modals.dart';

abstract class LocationHelper {
  static Future<void> fetchPosition({
    required InitController initC,
    required Rxn<Position> obs,
  }) async {
    try {
      var record = await initC.determinePosition();

      print('state services = ${record.$2}');

      // jika lokasi tidak aktif
      if (record.$2 == StatePermission.notActive) {
        _showModalLocation(() async {
          final state = await Geolocator.openLocationSettings();

          if (state) {
            final subService = initC.subscriptionServiceLocation;
            subService.onData(
              (data) async {
                if (data == ServiceStatus.enabled) {
                  final permission = await Geolocator.checkPermission();

                  if (permission == LocationPermission.denied) {
                    _showModalLocation(() async {
                      fetchPosition(initC: initC, obs: obs);
                      Get.back();
                    });
                  } else {
                    // record = (
                    //   await Geolocator.getCurrentPosition(
                    //     locationSettings: const LocationSettings(
                    //       accuracy: LocationAccuracy.high,
                    //     ),
                    //   ),
                    //   StatePermission.active,
                    // );

                    record = await initC.determinePosition();

                    print('record: $record');
                    obs.value = record.$1;
                    subService.cancel();
                  }

                  print('permission in onData = $permission');
                  Get.back();
                } else {
                  _showModalLocation(() async {
                    fetchPosition(initC: initC, obs: obs);
                    Get.back();
                  });
                }

                print('fetchPosition dipanggil');
                print('subService onData');
              },
            );
          }
        });
      }

      // jika lokasi perizinan ditolak
      if (record.$2 == StatePermission.denied) {
        _showModalLocation(() async {
          fetchPosition(
            initC: initC,
            obs: obs,
          );
          Get.back();
        });
      }

      // jika lokasi perizinan ditolak permanen
      if (record.$2 == StatePermission.deniedForever) {
        _showModalLocation(() async {
          await Geolocator.openAppSettings();
          Get.back();
        });
      }

      obs.value = record.$1;

      print('position = ${record.$1}');

      // return record.$1;
    } catch (e) {
      Logger().d('Error: $e');
    }

    return null;
  }

  static Stream<Position?> fetchPositionStream(InitController initC) async* {
    try {
      var record = await initC.determinePosition();
      print('state services = ${record.$2}');

      switch (record.$2) {
        case StatePermission.notActive:
          _showModalLocation(() async {
            final state = await Geolocator.openLocationSettings();
            if (state) {
              final subService = initC.subscriptionServiceLocation;
              subService.onData((data) async {
                if (data == ServiceStatus.enabled) {
                  Get.back();
                  final permission = await Geolocator.checkPermission();
                  print('permission after activated location = $permission');

                  if (permission == LocationPermission.denied) {
                    _showModalLocation(() async {
                      Get.back();
                      fetchPositionStream(initC); // Re-trigger the stream.
                    });
                  } else {
                    record = await initC.determinePosition();
                    print('record: $record');
                    // yield record.$1; // Emit the updated position.
                  }
                  print('permission in onData = $permission');
                }
                print('fetchPosition dipanggil');
                print('subService onData');
              });
            }
          });
          break;

        case StatePermission.denied:
          _showModalLocation(() async {
            fetchPositionStream(initC); // Re-trigger the stream.
            Get.back();
          });
          break;

        case StatePermission.deniedForever:
          _showModalLocation(() async {
            await Geolocator.openAppSettings();
            Get.back();
          });
          break;

        default:
          print('state permission default case');
      }

      print('position = ${record.$1}');
      yield record.$1; // Emit the position.
    } catch (e) {
      Logger().d('Error: $e');
      yield null; // Emit null in case of an error.
    }
  }

  static void _showModalLocation(Function() onPressed) {
    Modals.bottomSheet(
      context: Get.context!,
      content: const CustomModal(
        imagePath: ConstantsAssets.imgNoAccessLocation,
        title: 'Aktifkan layanan lokasi di-HP Anda',
        description:
            'Lokasi Anda akan terdeteksi secara otomatis untuk mempercepat proses absensi.',
      ),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: onPressed,
        child: const Text('Aktifkan Lokasi'),
      ),
    );
  }
}
