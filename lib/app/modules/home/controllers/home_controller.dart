import 'dart:async';
import 'dart:io';

import 'package:action_slider/action_slider.dart';
import 'package:assist_hadir/app/data/model/dashboard/res/res_dashboard_model.dart';
import 'package:assist_hadir/app/data/model/events/events_model.dart';
import 'package:assist_hadir/app/data/model/navigations/navigation_model.dart';
import 'package:assist_hadir/app/modules/home/widgets/not_allowed_attendance_modal.dart';
import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:assist_hadir/app/helpers/logger_helper.dart';
import 'package:latlong2/latlong.dart';
import 'package:assist_hadir/services/attendance/attendance_services.dart';
import 'package:assist_hadir/shared/shared_enum.dart';
import 'package:assist_hadir/utils/constants_assets.dart';
import 'package:assist_hadir/utils/constants_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../../../services/home/home_services.dart';
import '../../../data/model/attendance/req/req_attendance_model.dart';
import '../../../data/model/dashboard/res/data/data_dashboard_model.dart';
import '../../../helpers/format_date_time.dart';
import '../../../helpers/time_helper.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/buttons/buttons.dart';
import '../../widgets/dialog/dialogs.dart';
import '../../widgets/modal/custom_modal.dart';
import '../../widgets/modal/modals.dart';

class HomeController extends GetxController {
  late final InitController _initC;
  late final HomeServices _homeS;
  late final AttendanceServices _attendanceS;
  StreamSubscription<Duration>? _startTimeObserver;

  late final ActionSliderController actionSliderC;

  String? _userId;
  String? _firstName = '';
  String? profilePicture;
  String? _organizationId;
  String? _attendanceId;
  DataDashboardModel? dataDashboard;

  final shift = RxnString();
  final startTime = RxnString();
  final restStartTime = RxnString();
  final restEndTime = RxnString();
  final endTime = RxnString();
  final restTime = RxnString();
  final workTime = RxnString();
  final events = RxList<EventsModel>();

  // untuk cek apakah slide mulai istirahat atau tidak
  final isRest = false.obs;
  final isLoading = false.obs;
  final countForwardTime = '00:00:00'.obs;

  final dataAttributes = [
    ConstantsAssets.icStartTimeWork,
    ConstantsAssets.icBreak,
    ConstantsAssets.icEndTimeWork,
    ConstantsAssets.icWorkingHours,
  ];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _homeS = HomeServices(_initC);
    _attendanceS = AttendanceServices(_initC);

    actionSliderC = ActionSliderController();

    _prepareStorage();
    _workerListener();
    await fetchDashboard();
    _listenAction();
  }

  void _workerListener() {
    // jika interet aktif maka ambil data dashboard
    ever(
      _initC.isConnectedInternet,
      (value) {
        // ambil data dari internet
        if (value) {
          print('internet aktif');
          fetchDashboard();
        } else {
          print('internet tidak aktif');
          // ambil data dari local storage
          _prepareStorageDateTime();
          _prepareStorageEvents();
          _prepareStorageAttendanceId();
        }
      },
    );
  }

  void _prepareStorage() {
    _userId = _initC.localStorage.read<String>(ConstantsKeys.userId);
    _firstName = _initC.localStorage.read<String>(ConstantsKeys.name);
    profilePicture = _initC.localStorage.read(ConstantsKeys.profilPicture);
    _organizationId =
        _initC.localStorage.read<String>(ConstantsKeys.organizationId);

    _initC.localStorage.listenKey(
      ConstantsKeys.name,
      (value) {
        _firstName = value;
      },
    );
  }

  void _prepareStorageDateTime() {
    // local storage
    _checkAndReadDateTimeInLocalStorage(
      obs: startTime,
      keyLocalDateTime: ConstantsKeys.startTimeWork,
    ); // jam masuk
    _checkAndReadDateTimeInLocalStorage(
      obs: restStartTime,
      keyLocalDateTime: ConstantsKeys.restStartTime,
    ); // mulai istirahat
    _checkAndReadDateTimeInLocalStorage(
      obs: restEndTime,
      keyLocalDateTime: ConstantsKeys.restEndTime,
    ); // selesai istriahat
    _checkAndReadDateTimeInLocalStorage(
      obs: endTime,
      keyLocalDateTime: ConstantsKeys.endTimeWork,
    ); // jam keluar
    _checkAndReadTotalTimeInLocalStorage(
      obs: restTime,
      keyLocalTotalTime: ConstantsKeys.restTime,
    ); // total istirahat
    _checkAndReadTotalTimeInLocalStorage(
      obs: workTime,
      keyLocalTotalTime: ConstantsKeys.workTime,
    ); // total jam kerja
  }

  void _prepareStorageAttendanceId() {
    _checkAndReadAttendanceId();
  }

  void _prepareStorageEvents() {
    _checkAndReadEventsInLocalStorage(); // data event;
  }

  // action slider
  void _listenAction() {
    // actionSliderC =
    //     ActionSliderController(anchorPosition: isRest.value ? 1 : 0);
    actionSliderC.setAnchorPosition(isRest.value ? 1 : 0);
    actionSliderC.addListener(
      () async {
        final anchorPosition = actionSliderC.value.anchorPosition;

        // mulai istirahat
        if (anchorPosition == 1) {
          print('slide mulai istirahat');

          Modals.bottomSheet(
            context: Get.context!,
            onClosePressed: () {
              actionSliderC.setAnchorPosition(0);
              Get.back();
            },
            content: const CustomModal(
              imagePath: ConstantsAssets.icBreakTime,
              title: 'Waktunya makan siang ! 🍱',
              description: 'Yuk, istirahat sejenak dan isi energi?',
            ),
            actions: Column(
              children: [
                Obx(
                  () => Buttons.filled(
                    width: double.infinity,
                    state: isLoading.value,
                    onPressed: () => rest(false),
                    child: const Text('Siap, makan dulu!'),
                  ),
                ),
                const SizedBox(height: 12),
                Buttons.text(
                  width: double.infinity,
                  onPressed: () {
                    actionSliderC.setAnchorPosition(0);
                    Get.back();
                  },
                  child: const Text('Nanti saja, masih sibuk'),
                ),
              ],
            ),
          );
        } else {
          print('slide akhiri istirahat');
          rest(true);
        }
      },
    );
  }

  void setShift(String shiftName) => shift.value = shiftName;

  void clearShift() {
    shift.value = null;
    Get.back();
  }

  (String, String) greetingMessage(DateTime? event) {
    var greeting = '';
    var descGreeting = '';

    if (event == null) return (greeting, descGreeting);

    if (TimeHelper.isWithinRange(event, 8, 0, 10, 0)) {
      greeting = 'Rise & Shine, $_firstName !🌟';
      descGreeting = 'Siap memulai hari yang produktif?';
    } else if (TimeHelper.isWithinRange(event, 10, 0, 11, 30)) {
      greeting = 'Keep the Spirit Up, $_firstName !⚡️';
      descGreeting = '3 jam produktif berlalu, tetap semangat !';
    } else if (TimeHelper.isWithinRange(event, 11, 30, 12, 30)) {
      greeting = 'Greet Progress,$_firstName !';
      descGreeting = 'Waktunya istirahat sejenak untuk energi lebih';
    } else if (TimeHelper.isWithinRange(event, 12, 30, 13, 30)) {
      greeting = 'Break Time, $_firstName ! 🍱';
      descGreeting = 'Nikmati istirahatmu, recharge energi';
    } else if (TimeHelper.isWithinRange(event, 13, 30, 14, 0)) {
      greeting = 'Welcome Back, $_firstName !';
      descGreeting = 'Siap lanjutkan misi hari ini?';
    } else if (TimeHelper.isWithinRange(event, 14, 0, 15, 30)) {
      greeting = 'Crushing It, $_firstName ! 💪';
      descGreeting = '6 jam produktif, 3 jam menuju finish line';
    } else if (TimeHelper.isWithinRange(event, 15, 30, 16, 30)) {
      greeting = 'Almost There, $_firstName ! 🎯';
      descGreeting = 'Tetap fokus di jam - jam terakhir';
    } else if (TimeHelper.isWithinRange(event, 16, 30, 17, 0)) {
      greeting = 'Mission Accomplished, $_firstName ! 🌟';
      descGreeting = 'Selesaikan tugasmu & pulang dengan bangga';
    } else {
      greeting = 'Extra Mile Mode, $_firstName ! 🚀';
      descGreeting = 'Apresiasi untuk dedikasimu !';
    }

    return (greeting, descGreeting);
  }

  Future<void> fetchDashboard() async {
    if (_organizationId != null) {
      isLoading.value = true;

      try {
        final res = await _homeS.dashboard(organizationId: _organizationId!);

        if (res.isOk) {
          final body = res.body;

          if (body != null) {
            final resBody = ResDashboardModel.fromJson(body);
            dataDashboard = resBody.data;
            final eventDate = dataDashboard?.date;
            final dataEvent = dataDashboard?.events;

            if (eventDate != null) {
              // cek jika tanggal event itu hari ini
              // final eventDateFormat = FormatDateTime.iso8601ToDateTime(
              //   pattern: 'yyyy-MM-dd',
              //   value: eventDate,
              // );

              final attendanceId = dataDashboard?.id;
              final startWork = dataDashboard?.checkIn;
              final endWork = dataDashboard?.checkOut;
              final breakStart = dataDashboard?.breakStart;
              final breakStop = dataDashboard?.breakStop;
              final breakHours = dataDashboard?.breakHours;
              final workHours = dataDashboard?.workHours;

              await _checkAndWriteAttendanceId(attendanceId);
              await _checkAndWriteDateTimeInLocalStorage(
                dateTime: startWork,
                keyLocalDateTime: ConstantsKeys.startTimeWork,
              );
              await _checkAndWriteDateTimeInLocalStorage(
                dateTime: breakStart,
                keyLocalDateTime: ConstantsKeys.restStartTime,
              );
              await _checkAndWriteDateTimeInLocalStorage(
                dateTime: breakStop,
                keyLocalDateTime: ConstantsKeys.restEndTime,
              );
              await _checkAndWriteDateTimeInLocalStorage(
                dateTime: endWork,
                keyLocalDateTime: ConstantsKeys.endTimeWork,
              );
              await _checkAndWriteTotalInLocalStorage(
                totalTime: breakHours,
                keyLocalTotalTime: ConstantsKeys.restTime,
              );
              await _checkAndWriteTotalInLocalStorage(
                totalTime: workHours,
                keyLocalTotalTime: ConstantsKeys.workTime,
              );

              // setelah ditulis semua ke localstorage
              // lalu tampilkan data semua tadi ke ui
              _prepareStorageDateTime();
              _prepareStorageAttendanceId();

              // Tanggal absensi hari ini
              //! SUDAH TIDAK DIGUNAKAN
              // if (eventDateFormat != null) {
              //   if (eventDateFormat.compareTo(dateNow) == 0) {
              //     final attendanceId = dataDashboard?.id;
              //     final startWork = _dataDashboard?.checkIn;
              //     final endWork = _dataDashboard?.checkOut;
              //     final breakStart = _dataDashboard?.breakStart;
              //     final breakStop = _dataDashboard?.breakStop;
              //     final breakHours = _dataDashboard?.breakHours;
              //     final workHours = _dataDashboard?.workHours;

              //     await _checkAndWriteAttendanceId(attendanceId);
              //     await _checkAndWriteDateTimeInLocalStorage(
              //       dateTime: startWork,
              //       keyLocalDateTime: ConstantsKeys.startTimeWork,
              //     );
              //     await _checkAndWriteDateTimeInLocalStorage(
              //       dateTime: breakStart,
              //       keyLocalDateTime: ConstantsKeys.restStartTime,
              //     );
              //     await _checkAndWriteDateTimeInLocalStorage(
              //       dateTime: breakStop,
              //       keyLocalDateTime: ConstantsKeys.restEndTime,
              //     );
              //     await _checkAndWriteDateTimeInLocalStorage(
              //       dateTime: endWork,
              //       keyLocalDateTime: ConstantsKeys.endTimeWork,
              //     );
              //     await _checkAndWriteTotalInLocalStorage(
              //       totalTime: breakHours,
              //       keyLocalTotalTime: ConstantsKeys.restTime,
              //     );
              //     await _checkAndWriteTotalInLocalStorage(
              //       totalTime: workHours,
              //       keyLocalTotalTime: ConstantsKeys.workTime,
              //     );

              //     // setelah ditulis semua ke localstorage
              //     // lalu tampilkan data semua tadi ke ui
              //     _prepareStorageDateTime();
              //     _prepareStorageAttendanceId();
              //   } else {
              //     // hapus tanggal dan waktu yang tersimpan sebelumnya di local storage
              //     //! ini bersifat sementara untuk hari ini jika dia punya shift malam
              //     //! maka kode dibawah tidak berlaku dan akan direvisi ulang
              //     _initC.localStorage
              //       ..remove(ConstantsKeys.startTimeWork)
              //       ..remove(ConstantsKeys.restStartTime)
              //       ..remove(ConstantsKeys.restEndTime)
              //       ..remove(ConstantsKeys.endTimeWork)
              //       ..remove(ConstantsKeys.restTime)
              //       ..remove(ConstantsKeys.workTime);
              //   }
              // }

              // riwayat aktivitas
              if (dataEvent != null) {
                _writeEvents(dataEvent);
                _prepareStorageEvents();
              }
            }
          }
        } else {
          if (res.statusCode == HttpStatus.unauthorized) {
            _initC.redirectLogout(Get.context!);
          } else {
            _initC.showDialogFailed(
              onPressed: () {
                fetchDashboard();
                Get.back();
              },
            );
          }
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: fetchDashboard $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      _prepareStorageDateTime();
      _prepareStorageEvents();
      _prepareStorageAttendanceId();
    }
  }

  void checkIsAlreadyCheckin() async {
    if (_organizationId != null) {
      isLoading.value = true;

      final params = {
        'shift': shift.value,
        'organizationId': _organizationId,
      };

      print('req params = $params ');

      try {
        final res = await _homeS.isAlreadyCheckedIn(params);

        print('res statusCode = ${res.statusCode}');
        print('res body = ${res.body}');

        if (res.isOk) {
          moveToMaps(StatusAbsenceSetup.checkIn);
        } else {
          if (res.statusCode == HttpStatus.unauthorized) {
            _initC.redirectLogout(Get.context!);
          } else {
            _showModalNotAllowedAttendance();
          }
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: fetchDashboard $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _showModalNotAllowedAttendance() {
    Modals.bottomSheet(
      context: Get.context!,
      content: const NotAllowedAttendanceModal(),
      actions: Buttons.filled(
        width: double.infinity,
        onPressed: Get.back,
        child: const Text('Oke, terima kasih'),
      ),
    );
  }

  Future<void> _checkAndWriteAttendanceId(String? id) async {
    if (id != null) {
      if (_initC.localStorage.hasData(ConstantsKeys.attendanceId)) {
        final localAttendanceId =
            _initC.localStorage.read<String>(ConstantsKeys.attendanceId)!;

        if (localAttendanceId != id) {
          await _initC.localStorage.write(ConstantsKeys.attendanceId, id);
        }
      } else {
        await _initC.localStorage.write(ConstantsKeys.attendanceId, id);
      }
    }
  }

  Future<void> _checkAndWriteDateTimeInLocalStorage({
    required String? dateTime,
    required String keyLocalDateTime,
  }) async {
    // masukkan ke local storage dulu
    if (dateTime != null) {
      final fApi = FormatDateTime.iso8601ToDateTime(value: dateTime)!;

      // cek dulu apakah sudah ada waktu di local storage
      if (_initC.localStorage.hasData(keyLocalDateTime)) {
        // cek apakah waktu sama dengan waktu yang ada di api
        final localTimeWork =
            _initC.localStorage.read<String>(keyLocalDateTime);

        final fLocal = FormatDateTime.iso8601ToDateTime(value: localTimeWork)!;

        // jika tanggal di local dan tanggal di api tidak sama maka tulis ulang tanggal dan waktu di local storage
        if (!fLocal.isAtSameMomentAs(fApi)) {
          await _initC.localStorage.write(
            keyLocalDateTime,
            fApi.toIso8601String(),
          );
        }
      } else {
        await _initC.localStorage.write(
          keyLocalDateTime,
          fApi.toIso8601String(),
        );
      }
    }
  }

  Future<void> _checkAndWriteTotalInLocalStorage({
    required String? totalTime,
    required String keyLocalTotalTime,
  }) async {
    // masukkan ke local storage dulu
    if (totalTime != null) {
      await _initC.localStorage.writeIfNull(keyLocalTotalTime, totalTime);
    }
  }

  Future<void> _writeEvents(List<EventsModel> dataEvent) async {
    try {
      final mapEvents = dataEvent.map((e) => e.toJson()).toList();
      await _initC.localStorage.write(ConstantsKeys.events, mapEvents);
    } catch (e) {
      _initC.logger.e('Error: $e');
    }
  }

  void _checkAndReadAttendanceId() {
    _attendanceId =
        _initC.localStorage.read<String>(ConstantsKeys.attendanceId);
    print('attendanceId = $_attendanceId');
  }

  void _checkAndReadDateTimeInLocalStorage({
    required RxnString obs,
    required String keyLocalDateTime,
  }) {
    if (_initC.localStorage.hasData(keyLocalDateTime)) {
      // cek apakah waktu sama dengan waktu yang ada di api
      final localTime = _initC.localStorage.read<String>(keyLocalDateTime);
      final fLocal = FormatDateTime.iso8601ToDateTime(value: localTime)!;

      print('keyLocalDateTime = $keyLocalDateTime');
      print('localTime = $localTime');

      switch (keyLocalDateTime) {
        // jika jam masuk maka jalankan timer kedepan
        case ConstantsKeys.startTimeWork:
          // observe timer kedepan
          _startTimeObserver = TimeHelper.streamDiffDuration(fLocal).listen(
            (event) =>
                countForwardTime.value = FormatDateTime.durationToString(event),
          );
          break;
        case ConstantsKeys.restStartTime:
          isRest.value = true;
          break;
        case ConstantsKeys.restEndTime:
          isRest.value = false;
          break;
        case ConstantsKeys.endTimeWork:
          _startTimeObserver?.cancel();
          break;
        default:
      }

      obs.value = localTime;
    }
  }

  void _checkAndReadTotalTimeInLocalStorage({
    required RxnString obs,
    required String keyLocalTotalTime,
  }) {
    obs.value = _initC.localStorage.read<String>(keyLocalTotalTime);
  }

  void _checkAndReadEventsInLocalStorage() {
    if (_initC.localStorage.hasData(ConstantsKeys.events)) {
      final localEvents = _initC.localStorage
          .read<List<Map<String, dynamic>>>(ConstantsKeys.events);

      final dataEvents =
          localEvents?.map((e) => EventsModel.fromJson(e)).toList();
      if (dataEvents != null) {
        events.value = dataEvents;
      }
    }
  }

  void rest(bool isFinish) async {
    final now = FormatDateTime.dateToString(
      newPattern: 'yyyy-MM-dd',
      value: DateTime.now().toString(),
    );

    if (isFinish) {
      moveToMaps(StatusAbsenceSetup.restStop);
    } else {
      // isLoading.value = true;

      // cek jika attendance id belum ada maka cek di local storage
      if (_attendanceId != null) {
        if (_initC.localStorage.hasData(ConstantsKeys.attendanceId)) {
          _attendanceId =
              _initC.localStorage.read<String>(ConstantsKeys.attendanceId);
        }
      }

      try {
        isLoading.value = true;

        final reqAttendance = ReqAttendanceModel(
          userId: _userId,
          organizationId: _organizationId,
          attendanceId: _attendanceId,
          date: now,
          approved: "valid",
          type: 'breakStart',
        );

        final res = await _attendanceS.updateAttendance(reqAttendance.toJson());

        if (res.isOk) {
          final body = res.body;
          if (body != null) fetchDashboard();
        } else {
          if (res.statusCode == HttpStatus.unauthorized) {
            _initC.redirectLogout(Get.context!);
          } else {
            _initC.showDialogFailed(
              onPressed: () {
                fetchDashboard();
                Get.back();
              },
            );
          }
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: rest $e');
      } finally {
        isLoading.value = false;
        Get.back();
      }
    }
  }

  void moveToMaps(StatusAbsenceSetup typeAbsence) {
    final navModel = NavigationModel(
      absenceType: typeAbsence,
      shift: shift.value,
      clinicPosition: (dataDashboard?.position != null)
          ? LatLng(
              dataDashboard!.position!.lat ?? 0,
              dataDashboard!.position!.lng ?? 0,
            )
          : null,
      radius: (dataDashboard?.radius != null)
          ? dataDashboard?.radius?.toDouble()
          : 0.0,
    );

    LoggerHelper.logPrettyJson(navModel.toJson());

    if (typeAbsence == StatusAbsenceSetup.checkIn) {
      Get.offAndToNamed(Routes.LOCATION_MAPS, arguments: navModel);
    } else {
      Get.toNamed(Routes.LOCATION_MAPS, arguments: navModel);
    }
  }

  void moveToActivityHistory() => Get.toNamed(Routes.ACTIVITY_HISTORY);

  void moveToProfile() => Get.toNamed(Routes.PROFILE);

  @override
  void onClose() {
    _startTimeObserver?.cancel();
    _startTimeObserver = null;
    super.onClose();
  }
}
