import 'dart:async';

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

class LocationHelper {
  late final InitController _initC;
  // late final Stream<ServiceStatus> _subService;
  StreamSubscription<ServiceStatus>? _subService;

  LocationHelper(this._initC);

  void close() {
    _subService?.cancel();
  }

  Future<void> fetchPosition({
    required Rxn<Position> obs,
  }) async {
    try {
      var record = await _initC.determinePosition();
      print('state services = ${record.$2}');

      switch (record.$2) {
        case StatePermission.notActive:
          _handleNotActiveState(obs, record);
          break;
        case StatePermission.denied:
          _handleDeniedState(obs, record);
          break;
        case StatePermission.deniedForever:
          _handleDeniedForeverState(record);
          break;
        case StatePermission.active:
          final record = await _initC.determinePosition();
          obs.value = record.$1;
          break;
      }

      print('position = ${record.$1}');
    } catch (e) {
      Logger().d('Error: $e');
    }
  }

  void _handleNotActiveState(Rxn<Position> obs, var record) {
    _showModalLocation(
      title: 'Aktifkan layanan lokasi di-HP Anda',
      description:
          'Lokasi Anda akan terdeteksi secara otomatis untuk mempercepat proses absensi.',
      state: record.$2,
      onPressed: () async {
        final state = await Geolocator.openLocationSettings();
        print('state open location = $state');

        if (state) {
          Get.back();
          _subService = Geolocator.getServiceStatusStream().listen(
            (event) async {
              print('state event = $event');
              if (event == ServiceStatus.enabled) {
                final permission = await Geolocator.checkPermission();
                print('state permission in onData = $permission');

                if (permission == LocationPermission.denied) {
                  _handleDeniedState(obs, record);
                } else {
                  record = await _initC.determinePosition();
                  print('record: $record');
                  obs.value = record.$1;
                }
              } else {
                _handleNotActiveState(obs, record);
              }
              print('fetchPosition dipanggil');
              print('subService onData');
            },
          );
        }
      },
    );
  }

  void _handleDeniedState(Rxn<Position> obs, var record) {
    _showModalLocation(
      title: 'Aktifkan perizinal lokasi di-HP Anda',
      description:
          'Perizinan lokasi dibutuhkan untuk mempercepat proses absensi.',
      state: record.$2,
      onPressed: () async {
        fetchPosition(obs: obs);
        Get.back();
      },
    );
  }

  void _handleDeniedForeverState(var record) {
    _showModalLocation(
      title: 'Aktifkan perizinal lokasi di-HP Anda',
      description:
          'Perizinan lokasi dibutuhkan untuk mempercepat proses absensi.',
      state: record.$2,
      onPressed: () async {
        await Geolocator.openAppSettings();
        Get.back();
      },
    );
  }

  static void _showModalLocation({
    required String title,
    required String description,
    required StatePermission state,
    required Function() onPressed,
  }) {
    Modals.bottomSheet(
      context: Get.context!,
      content: CustomModal(
        imagePath: ConstantsAssets.imgNoAccessLocation,
        title: title,
        description: description,
      ),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: onPressed,
        child: const Text('Aktifkan Lokasi'),
      ),
      onClosePressed: () {
        if (state != StatePermission.active) {
          // kembali ke halaman home view
          Get.back();
          Get.back(result: false);
        } else {
          Get.back(result: false);
        }
      },
    );
  }
}
