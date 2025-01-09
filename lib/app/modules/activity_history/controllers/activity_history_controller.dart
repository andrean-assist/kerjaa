import 'package:assist_hadir/app/data/model/attendance/res/data/data_attendance_model.dart';
import 'package:assist_hadir/app/data/model/attendance/res/res_attendance_model.dart';
import 'package:assist_hadir/app/helpers/format_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../../../services/home/home_services.dart';
import '../../../../utils/constants_keys.dart';
import '../../init/controllers/init_controller.dart';

class ActivityHistoryController extends GetxController
    with StateMixin<List<DataAttendanceModel>> {
  late final InitController _initC;
  late final HomeServices _homeS;

  final fromDateC = TextEditingController(
    text: FormatDateTime.dateToString(
      newPattern: 'EEE, dd MMM yyyy',
      value: DateTime.now().toString(),
    ),
  );
  final toDateC = TextEditingController(
    text: FormatDateTime.dateToString(
      newPattern: 'EEE, dd MMM yyyy',
      value: DateTime.now().toString(),
    ),
  );

  String? _organizationId;
  final selectedFilter = 0.obs;
  final selectedCustomDateFilter = 3.obs;

  final filters = ['Hari ini', '7 hari', '1 bulan', 'Pilih tanggal'];

  final selectedFromDate = DateTime.now().obs;
  final selectedToDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    _initServices();
    _workerListener();
    _prepareStorage();
    fetchHistory(0);

    debounce(
      selectedFilter,
      (index) => fetchHistory(index),
    );
  }

  void _initServices() {
    _homeS = HomeServices(_initC);
  }

  void _workerListener() {
    // jika interet aktif maka ambil data dashboard
    ever(
      _initC.isConnectedInternet,
      (value) {
        // ambil data dari internet
        if (value) {
          fetchHistory(selectedFilter.value);
        }
      },
    );
  }

  void _prepareStorage() {
    _organizationId =
        _initC.localStorage.read<String>(ConstantsKeys.organizationId);
  }

  void setFilter(int? index) => selectedFilter.value = index ?? 0;

  void setDate({
    required bool isFromDate,
    required DateTime dateTime,
  }) {
    if (isFromDate) {
      selectedFromDate.value = dateTime;
    } else {
      selectedToDate.value = dateTime;
    }
  }

  void fetchHistory(int index) async {
    change(null, status: RxStatus.loading());

    const datePattern = 'yyyy-MM-dd';
    final now = DateTime.now();
    final formatDateNow = FormatDateTime.dateToString(
      newPattern: datePattern,
      value: now.toString(),
    );

    if (_organizationId != null) {
      final query = {
        'organizationId': _organizationId,
      };

      switch (index) {
        case 0: // hari ini
          query.addAll({
            'fromDate': formatDateNow,
            'toDate': formatDateNow,
          });
          break;
        case 1: // 7 hari
          query.addAll({
            'fromDate': FormatDateTime.dateToString(
              newPattern: datePattern,
              value: now.subtract(7.days).toString(),
            ),
            'toDate': formatDateNow,
          });
          break;
        case 2: // bulan ini
          query.addAll({
            'fromDate': FormatDateTime.dateToString(
              newPattern: datePattern,
              value: DateTime(now.year, now.month - 1, 1).toString(),
            ),
            'toDate': FormatDateTime.dateToString(
              newPattern: datePattern,
              value: DateTime(now.year, now.month + 1, 0).toString(),
            ),
          });
          break;
        case 3: // pilih tanggal
          const oldPattern = 'EEE, dd MMM yyyy';
          query.addAll({
            'fromDate': FormatDateTime.dateToString(
              oldPattern: oldPattern,
              newPattern: datePattern,
              value: fromDateC.text,
            ),
            'toDate': FormatDateTime.dateToString(
              oldPattern: oldPattern,
              newPattern: datePattern,
              value: toDateC.text,
            ),
          });
          break;
        default:
      }

      try {
        final res = await _homeS.attendances(query);

        if (res.isOk) {
          final resBody = res.body;

          if (resBody != null) {
            final resAttendance = ResAttendanceModel.fromJson(resBody);
            final attendanceModel = resAttendance.data;

            if (attendanceModel != null && attendanceModel.isNotEmpty) {
              change(attendanceModel, status: RxStatus.success());
            } else {
              change(null, status: RxStatus.empty());
            }
          }
        } else {
          _initC.handleError(
            status: res.status,
            onLoad: () => fetchHistory(index),
          );

          // if (res.statusCode == HttpStatus.unauthorized) {
          //   _initC.redirectLogout(Get.context!);
          // } else {
          //   _initC.showDialogFailed(
          //     onPressed: () {
          //       fetchHistory(index);
          //       Get.back();
          //     },
          //   );
          // }
        }
      } on GetHttpException catch (e) {
        _initC.logger.e('Error: fetchHistory $e');
      }
    }
  }
}
