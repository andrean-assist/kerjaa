import 'dart:async';

import 'package:assist_hadir/app/data/model/navigations/navigation_model.dart';
import 'package:assist_hadir/app/data/model/verifications/location/location_verification_model.dart';
import 'package:assist_hadir/app/data/model/position/position_model.dart';
import 'package:assist_hadir/app/helpers/location_helper.dart';
import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:assist_hadir/app/modules/widgets/modal/custom_modal.dart';
import 'package:assist_hadir/shared/shared_enum.dart';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';

import '../../../../utils/constants_assets.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';
import '../../widgets/snackbar/snackbar.dart';
import '../widgets/modals/outside_checkin_modal.dart';

class LocationMapsController extends GetxController {
  late final InitController _initC;
  late final MapController mapC;
  StatusAbsenceSetup? _statusAbsenceArgs;
  StreamSubscription? _streamCurrentPosition;
  late final LocationHelper _locationHelper;

  final formKey = GlobalKey<FormState>();
  final reasonC = TextEditingController();

  NavigationModel? _args;
  final position = Rxn<LatLng>();
  var titleBar = '';
  var _isInsideRadius = false;

  final initialCenter = const LatLng(-1.5074342, 122.2910185);

  final zoom = 4.0;
  var radius = 100.0;
  LatLng? clinicPosition;

  final currentPosition = Rxn<Position>();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    mapC = MapController();
    _locationHelper = LocationHelper(_initC);

    _initArgs();

    _streamCurrentPosition = currentPosition.listen(
      (currPosition) {
        print('currPosition = $currPosition');
        // cek apakah posisi belum ada
        if (currPosition != null) {
          if (currPosition.isMocked) {
            // user menggunakan fake gps
            _showDialogUserUsingFakeGPS();
          } else {
            position.value = LatLng(
              currPosition.latitude,
              currPosition.longitude,
            );
            mapC.move(position.value!, 18);
          }
        }
      },
    );
  }

  void _initArgs() {
    final args = Get.arguments as NavigationModel?;
    _args = args;
    _statusAbsenceArgs = args?.absenceType;
    clinicPosition = args?.clinicPosition;
    radius = args?.radius ?? 0;

    if (_statusAbsenceArgs != null) {
      switch (_statusAbsenceArgs) {
        case StatusAbsenceSetup.checkIn:
          titleBar = 'Check In';
          break;
        case StatusAbsenceSetup.restStop:
          titleBar = 'Akhiri Istirahat';
          break;
        case StatusAbsenceSetup.checkOut:
          titleBar = 'Check Out';
          break;
        default:
      }
    }
  }

  @override
  void onReady() {
    print('onReady');
    _fetchLocation();
    super.onReady();
  }

  Future<void> _fetchLocation() async {
    try {
      _locationHelper.fetchPosition(obs: currentPosition);
      print('position = ${position.toJson()}');
    } catch (e) {
      _initC.logger.e('Error: $e');
    }
  }

  void checkIn() {
    if (clinicPosition != null) {
      final distance = Geolocator.distanceBetween(
        clinicPosition!.latitude,
        clinicPosition!.longitude,
        position.value?.latitude ?? 0,
        position.value?.longitude ?? 0,
      );

      if (distance <= radius) {
        _isInsideRadius = true;
        _moveToFaceDetect();
      } else {
        _isInsideRadius = false;
        _showDialogOutsideRadius();
      }
    } else {
      Snackbar.failed(
        context: Get.context!,
        content:
            'Posisi kantor/klinik tidak ditemukan, tidak bisa melakukan aksi selanjutnya',
      );
    }
  }

  void _showDialogOutsideRadius() {
    Modals.bottomSheetScroll(
      context: Get.context!,
      initialChildSize: 1,
      minChildSize: 1,
      maxChildSize: 1,
      expand: true,
      snap: false,
      snapSizes: [1],
      content: OutsideCheckinModal(reasonC),
      actions: Column(
        children: [
          Buttons.filled(
            width: double.infinity,
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }

              FocusScope.of(Get.context!).unfocus();
              _moveToFaceDetect();
            },
            child: const Text('Lanjutkan'),
          ),
          const SizedBox(height: 12),
          Buttons.text(
            width: double.infinity,
            onPressed: () {
              _fetchLocation();
              Get.back();
            },
            child: const Text('Cek ulang lokasi'),
          ),
        ],
      ),
    );
  }

  void _showDialogUserUsingFakeGPS() {
    Modals.bottomSheet(
      context: Get.context!,
      content: const CustomModal(
        imagePath: ConstantsAssets.imgFakeGPS,
        title: 'Ups! sepertinya Anda menggunakan GPS palsu',
        description:
            'Untuk keakuratan absensi, mohon matikan aplikasi GPS palsu dan gunakan GPS bawaan perangkat ya.',
      ),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: () {
          Get.back();
          _fetchLocation();
        },
        child: const Text('Perbaiki Lokasi'),
      ),
    );
  }

  void _moveToFaceDetect() {
    final navModel = _args?.copyWith.call(
      reason: (reasonC.text.isNotEmpty) ? reasonC.text.trim().toString() : null,
      location: LocationVerificationModel(
        locationVerified: _isInsideRadius,
        position: PositionModel(
          lat: position.value?.latitude ?? 0,
          lng: position.value?.longitude ?? 0,
        ),
      ),
    );

    // Get.back();
    Get.toNamed(Routes.FACE_DETECTION, arguments: navModel);
  }

  @override
  void onClose() {
    mapC.dispose();
    _streamCurrentPosition?.cancel();
    _streamCurrentPosition = null;
    _locationHelper.close();
    super.onClose();
  }
}
