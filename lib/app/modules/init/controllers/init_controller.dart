import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:app_settings/app_settings.dart';
import 'package:assist_hadir/app/modules/widgets/modal/custom_modal.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
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
  final _navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  // late final StreamSubscription<ServiceStatus> subscriptionServiceLocation;
  // final streamServiceLocation = ServiceStatus.disabled.obs;

  // Timer? _serviceStatusTimer;

  GetStorage get localStorage => _localStorage;

  final isConnectedInternet = true.obs;
  var _isShowModalInternet = false;
  var _isShowModalError = false;

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
    _initDeepLinks();
  }

  void _initListen() {
    _listenConnectivity();
    // _listenDeterminePosition();
  }

  Future<void> _initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      _openAppLink(uri);
    });
  }

  void _openAppLink(Uri uri) {
    _navigatorKey.currentState?.pushNamed(uri.fragment);
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
          showModalDisconnected();
        }
      }
    });
  }

  // void _listenDeterminePosition() {
  // streamServiceLocation.bindStream(Geolocator.getServiceStatusStream());

  // pengecekan manual
  // _serviceStatusTimer =
  //     Timer.periodic(const Duration(seconds: 1), (timer) async {
  //   final isEnabled = await Geolocator.isLocationServiceEnabled();
  //   final status = isEnabled ? ServiceStatus.enabled : ServiceStatus.disabled;

  //   print('status = $status');

  //   // Perbarui Rx hanya jika status berubah
  //   if (streamServiceLocation.value != status) {
  //     streamServiceLocation.value = status;
  //     print('Manual check detected change: $status');
  //   }

  //   print('streamServiceLocation = ${streamServiceLocation.value}');
  // });

  //   subscriptionServiceLocation = Geolocator.getServiceStatusStream().listen(
  //     (event) {
  //       print('event service status = $event');
  //     },
  //   );
  // }

  Future<void> setTimeStorage(String key) async => await _localStorage.write(
        key,
        DateTime.now().toIso8601String(),
      );

  void showModalDisconnected() {
    _isShowModalInternet = true;
    _isShowModalError = true;

    Modals.bottomSheetWithClose(
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
    ).then((_) {
      _isShowModalInternet = false;
    }).whenComplete(
      () => _isShowModalError = false,
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
      await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      ),
      StatePermission.active,
    );
  }

  Future<void> showDialogFailed({required dynamic Function() onPressed}) async {
    _isShowModalError = true;

    Modals.bottomSheetWithClose(
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
    ).whenComplete(
      () => _isShowModalError = false,
    );
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

  void handleError({
    required HttpStatus status,
    bool isFromLogin = false,
    void Function()? onLoad,
  }) {
    logger.d('debug: status code error = ${status.code}');
    logger.d('debug: isConnectedInternet = ${isConnectedInternet.value}');

    if (!_isShowModalError) {
      // jika internet mati
      if (!isConnectedInternet.value) {
        showModalDisconnected();
      } else {
        // jika otorisasi tidak valid
        if (status.isUnauthorized) {
          redirectLogout(Get.context!);
        } else if (status.hasError) {
          if (onLoad != null) {
            // jika gagal load data
            showDialogFailed(
              onPressed: () {
                onLoad();
                Get.back();
              },
            );
          }
        }
      }
    }
  }

  @override
  void onClose() {
    _subscriptionConnectivity.cancel();
    _linkSubscription?.cancel();

    // subscriptionServiceLocation.cancel();
    // streamServiceLocation.close();
    // _serviceStatusTimer?.cancel();
    super.onClose();
  }
}
