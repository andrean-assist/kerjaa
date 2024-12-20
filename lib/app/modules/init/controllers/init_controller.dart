import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:assist_hadir/app/modules/widgets/modal/custom_modal.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../shared/shared_enum.dart';
import '../../../../utils/constants_assets.dart';
import '../../../../utils/constants_keys.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/modal/modals.dart';
import '../../widgets/snackbar/snackbar.dart';

class InitController extends GetxController {
  late final GetStorage _localStorage;
  late final StreamSubscription<List<ConnectivityResult>>
      _subscriptionConnectivity;
  late final StreamSubscription<ServiceStatus> subscriptionServiceLocation;

  GetStorage get localStorage => _localStorage;

  final isConnectedInternet = true.obs;
  var _isShowModalInternet = false;

  final logger = Logger(
      printer: PrettyPrinter(
    dateTimeFormat: DateTimeFormat.onlyTime,
  ));

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _localStorage = GetStorage();
    _initListen();
  }

  void _initListen() {
    _listenConnectivity();
    _listenDeterminePosition();
  }

  bool? isUserFirstUsingApp() =>
      _localStorage.read<bool>(ConstantsKeys.isFirstUsingApp);

  Future<void> updateOnboarding() =>
      _localStorage.write(ConstantsKeys.isFirstUsingApp, false);

  void _listenConnectivity() {
    _subscriptionConnectivity =
        Connectivity().onConnectivityChanged.listen((result) {
      // Received changes in available connectivity types!
      if (result.contains(ConnectivityResult.mobile)) {
        isConnectedInternet.value = true;
        // Mobile network available.

        if (Get.currentRoute != Routes.SPLASH && _isShowModalInternet) {
          _isShowModalInternet = false;
          Get.back();
        }
      } else if (result.contains(ConnectivityResult.wifi)) {
        isConnectedInternet.value = true;
        // Wi-fi is available.
        // Note for Android:
        // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type

        if (Get.currentRoute != Routes.SPLASH && _isShowModalInternet) {
          _isShowModalInternet = false;
          Get.back();
        }
      } else if (result.contains(ConnectivityResult.ethernet)) {
        isConnectedInternet.value = true;
        // Ethernet connection available.
      } else if (result.contains(ConnectivityResult.vpn)) {
        // Vpn connection active.
        // Note for iOS and macOS:
        // There is no separate network interface type for [vpn].
        // It returns [other] on any device (also simulator)
        isConnectedInternet.value = true;
      } else if (result.contains(ConnectivityResult.bluetooth)) {
        // Bluetooth connection available.
      } else if (result.contains(ConnectivityResult.other)) {
        // Connected to a network which is not in the above mentioned networks.
      } else if (result.contains(ConnectivityResult.none)) {
        isConnectedInternet.value = false;
        // No available network types

        if (Get.currentRoute != Routes.SPLASH && !_isShowModalInternet) {
          _showModalDisconnected();
        }
      }
    });
  }

  void _listenDeterminePosition() {
    subscriptionServiceLocation = Geolocator.getServiceStatusStream().listen(
      (event) {
        print('event service status = $event');
      },
    );
  }

  Future<void> setTimeStorage(String key) async => await _localStorage.write(
        key,
        DateTime.now().toIso8601String(),
      );

  // void _listenPosition() {
  //   final streamPosition = Geolocator.getPositionStream();
  // }

  void _showModalDisconnected() {
    _isShowModalInternet = true;

    Modals.bottomSheet(
      context: Get.context!,
      content: const CustomModal(
        imagePath: ConstantsAssets.imgOffline,
        title: 'Sepertinya internet kamu sedang offline',
        description: 'Cek koneksi wifi atau kuota internetmu dan coba lagin',
      ),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: () async {
          try {
            if (GetPlatform.isAndroid) {
              final device = await DeviceInfoPlugin().androidInfo;
              final androidVersion = int.tryParse(device.version.release) ?? 0;

              if (androidVersion >= 10) {
                AppSettings.openAppSettingsPanel(
                  AppSettingsPanelType.internetConnectivity,
                );
              } else {
                AppSettings.openAppSettings(type: AppSettingsType.settings);
              }

              // print('version android = ${device.version.release}');
            }

            if (GetPlatform.isIOS) {
              AppSettings.openAppSettings(type: AppSettingsType.settings);
            }
          } catch (e) {
            logger.e('Error: $e');
          } finally {
            _isShowModalInternet = false;
            Get.back();
          }
        },
        child: const Text('Buka pengaturan'),
      ),
    );
  }

  Future<(Position?, StatePermission)> determinePosition() async {
    // LocationPermission permission;

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      // distanceFilter: 100,
    );

    // Test if location services are enabled.
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      // return Future.error('Layanan lokasi tidak aktif');
      return (null, StatePermission.notActive);
    }

    var permission = await Geolocator.checkPermission();
    print('permission = $permission');
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      print('request permission = $permission');

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        // return Future.error('Perizinan lokasi di tolak');
        return (null, StatePermission.denied);
      }

      if (permission == LocationPermission.deniedForever) {
        return (null, StatePermission.deniedForever);
      }

      if (permission == LocationPermission.whileInUse) {
        return (
          await Geolocator.getCurrentPosition(
            locationSettings: locationSettings,
          ),
          StatePermission.active,
        );
      }

      return (null, StatePermission.denied);
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      //     'Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin.');
      return (null, StatePermission.deniedForever);
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return (
      // Geolocator.getPositionStream(locationSettings: locationSettings),
      await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      ),
      StatePermission.active,
    );
  }

  Future<void> showDialogFailed({required dynamic Function() onPressed}) async {
    Modals.bottomSheet(
      context: Get.context!,
      isDismissible: true,
      enableDrag: false,
      content: const CustomModal(
        imagePath: ConstantsAssets.imgPrepare,
        title: 'Opps.. kami sedang merapikan semua nya.',
        description: 'Sebentar lagi selesai kok!. Tunggu kami ya 😊',
      ),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: onPressed,
        child: const Text('Muat Ulang'),
      ),
    );

    // if (isLoading.value) {
    //   Future.delayed(
    //     5.seconds,
    //     () {
    //       isLoading.value = false;
    //       Get.back();
    //     },
    //   );
    // }
  }

  void redirectLogout(BuildContext context) async {
    Snackbar.info(
      context: context,
      content: 'Sesi anda telah berakhir, silahkan login kembali',
    );

    try {
      // clear cache login
      await _localStorage.erase();
      await _localStorage.write(ConstantsKeys.isFirstUsingApp, false);

      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  @override
  void onClose() {
    _subscriptionConnectivity.cancel();
    subscriptionServiceLocation.cancel();
    super.onClose();
  }
}
