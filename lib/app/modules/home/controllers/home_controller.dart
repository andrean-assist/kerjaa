import 'dart:async';
import 'dart:io';

import 'package:action_slider/action_slider.dart';
import 'package:assist_hadir/app/data/model/dashboard/res/res_dashboard_model.dart';
import 'package:assist_hadir/app/data/model/events/events_model.dart';
import 'package:assist_hadir/app/data/model/navigations/navigation_model.dart';
import 'package:assist_hadir/app/data/model/user/user_model.dart';
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
  final profilePicture = RxnString();
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
  final isShiftEnabled = false.obs;

  // untuk cek apakah slide mulai istirahat atau tidak
  final isRest = false.obs;
  final isLoading = false.obs;
  final countForwardTime = '00:00:00'.obs;
  final isHasResultMaps = false;

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
    profilePicture.value =
        _initC.localStorage.read(ConstantsKeys.profilPicture);
    _organizationId =
        _initC.localStorage.read<String>(ConstantsKeys.organizationId);

    _initC.localStorage.listenKey(
      ConstantsKeys.name,
      (value) {
        _firstName = value;
      },
    );

    _initC.localStorage.listenKey(
      ConstantsKeys.profilPicture,
      (value) => profilePicture.value = value,
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
    actionSliderC.setAnchorPosition(isRest.value ? 1 : 0);
    _addListenerAction();
  }

  void _addListenerAction() {
    actionSliderC.addListener(
      () async {
        final anchorPosition = actionSliderC.value.anchorPosition;

        print('test anchorPosition = $anchorPosition');
        print('test isRest.value = ${isRest.value}');

        // mulai istirahat
        if (anchorPosition == 1 && !isRest.value) {
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
        } else if (anchorPosition == 0 && isRest.value) {
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

        print('res isOk = ${res.isOk}');
        print('res statusCode = ${res.statusCode}');
        print('res statusText = ${res.statusText}');
        print('res ${res.headers}');

        if (res.isOk) {
          final body = res.body;

          if (body != null) {
            final resBody = ResDashboardModel.fromJson(body);
            dataDashboard = resBody.data;

            final attendance = dataDashboard?.attendance;
            final organization = dataDashboard?.organization;
            final user = dataDashboard?.user;

            final eventDate = attendance?.date;
            final dataEvent = attendance?.events;
            isShiftEnabled.value = organization?.shift != null;

            if (eventDate != null) {
              final attendanceId = attendance?.id;
              final startWork = attendance?.checkIn;
              final endWork = attendance?.checkOut;
              final breakStart = attendance?.breakStart;
              final breakStop = attendance?.breakStop;
              final breakHours = attendance?.breakHours;
              final workHours = attendance?.workHours;

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

              // riwayat aktivitas
              if (dataEvent != null) {
                _writeEvents(dataEvent);
                _prepareStorageEvents();
              }
            }

            if (user != null) {
              profilePicture.value = user.avatar;

              await _checkAndWriteProfile(user);
            }
          }
        } else {
          _initC.handleError(status: res.status, onLoad: fetchDashboard);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: fetchDashboard $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      // _initC.showDialogFailed(
      //   onPressed: () {
      //     fetchDashboard();
      //     Get.back();
      //   },
      // );

      _prepareStorageDateTime();
      _prepareStorageEvents();
      _prepareStorageAttendanceId();
    }
  }

  void isAlreadyCheckin() async {
    if (_organizationId != null) {
      isLoading.value = true;

      final params = {
        'shift': shift.value,
        'organizationId': _organizationId,
        'date': FormatDateTime.dateToString(
          newPattern: 'yyyy-MM-dd',
          value: DateTime.now().toString(),
        ),
      };

      try {
        final res = await _homeS.isAlreadyCheckedIn(params);

        if (res.isOk) {
          moveToMaps(StatusAbsenceSetup.checkIn);
        } else {
          if (!_initC.isConnectedInternet.value) {
            _initC.showModalDisconnected();
          } else {
            if (res.statusCode == HttpStatus.unauthorized) {
              _initC.redirectLogout(Get.context!);
            } else {
              String title;
              String description;

              if (res.statusCode == HttpStatus.preconditionFailed) {
                title = 'Opps.. Anda tidak bisa menggunakan absen!';
                description = 'Kamu sudah absen sebelumnya pada shift ini';
              } else {
                title =
                    'Opps.. Anda tidak bisa menggunakan absen mobile di hari ini!';
                description =
                    'Karena di awal Anda absen di Website, untuk saat ini hanya bisa istirahat dan checkout di Website ya.';
              }

              _showModalNotAllowedAttendance(title, description);
            }
          }
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: fetchDashboard $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _showModalNotAllowedAttendance(String title, String description) {
    Modals.bottomSheet(
      context: Get.context!,
      content: NotAllowedAttendanceModal(title, description),
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

  Future<void> _checkAndWriteProfile(UserModel user) async {
    _initC.localStorage
      ..write(ConstantsKeys.name, user.name)
      ..write(ConstantsKeys.profilPicture, user.avatar)
      ..write(ConstantsKeys.organizationId, user.organizationId)
      ..write(ConstantsKeys.position, user.position)
      ..write(ConstantsKeys.email, user.email);
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
    } else {
      // hapus data di local storage
      await _initC.localStorage.remove(keyLocalDateTime);
    }
  }

  Future<void> _checkAndWriteTotalInLocalStorage({
    required String? totalTime,
    required String keyLocalTotalTime,
  }) async {
    // masukkan ke local storage dulu
    if (totalTime != null) {
      await _initC.localStorage.writeIfNull(keyLocalTotalTime, totalTime);
    } else {
      // hapus data di local storage
      await _initC.localStorage.remove(keyLocalTotalTime);
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

        LoggerHelper.logPrettyJson(reqAttendance.toJson());

        final res = await _attendanceS.updateAttendance(reqAttendance.toJson());

        print('res status text = ${res.statusText}');

        if (res.isOk) {
          final body = res.body;
          if (body != null) fetchDashboard();
        } else {
          _initC.handleError(status: res.status, onLoad: fetchDashboard);
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: rest $e');
      } finally {
        isLoading.value = false;
        Get.back();
      }
    }
  }

  Future<void> moveToMaps(StatusAbsenceSetup typeAbsence) async {
    final organization = dataDashboard?.organization;
    final isShift = organization?.isShift ?? false;

    final navModel = NavigationModel(
      absenceType: typeAbsence,
      shift: isShift ? shift.value : 'general',
      clinicPosition: (organization != null && organization.position != null)
          ? LatLng(
              organization.position!.lat ?? 0,
              organization.position!.lng ?? 0,
            )
          : null,
      radius: (organization?.radius != null)
          ? organization?.radius?.toDouble()
          : 0.0,
    );

    if (typeAbsence == StatusAbsenceSetup.checkIn) {
      Get.toNamed(Routes.LOCATION_MAPS, arguments: navModel);
    } else {
      final result =
          await Get.toNamed(Routes.LOCATION_MAPS, arguments: navModel);

      if (result == null) {
        // kembalikan action slider ke posisi sebelumnya
        // jika user tidak jadi melakukan slide
        actionSliderC.removeListener(() {});
        _listenAction();
      }
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
