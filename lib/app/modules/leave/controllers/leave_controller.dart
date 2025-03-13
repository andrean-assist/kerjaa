import 'package:assist_hadir/app/modules/init/controllers/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveController extends GetxController {
  late final InitController _initC;
  late final PageController pageC;

  final currentPage = 0.obs;

  final filters = ['Tanggal', 'Jenis pengajuan', 'Status'];

  final dataLeave = [
    {
      'title': 'Sisa cuti tahunan',
      'total': '12',
      'expired': DateTime.now().add(const Duration(days: 30)),
    },
    {
      'title': 'Sisa cuti melahirkan',
      'total': '90',
      'expired': DateTime.now().add(const Duration(days: 120)),
    },
    {
      'title': 'Sisa cuti keguguran',
      'total': '45',
      'expired': DateTime.now().add(const Duration(days: 365)),
    },
    {
      'title': 'Sisa cuti pernikahan',
      'total': '3',
      'expired': DateTime.now().add(const Duration(days: 365)),
    },
    {
      'title': 'Sisa cuti kematian',
      'total': '2',
      'expired': DateTime.now().add(const Duration(days: 365)),
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    pageC = PageController();
    pageC.addListener(_setCurrentPage);
  }

  void _setCurrentPage() {
    currentPage.value = pageC.page?.toInt() ?? 0;
  }
}
