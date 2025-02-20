import 'package:assist_hadir/app/modules/overtime/controllers/submission_overtime_controller.dart';
import 'package:get/get.dart';

import '../controllers/overtime_controller.dart';

class OvertimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OvertimeController>(() => OvertimeController());
    Get.lazyPut<SubmissionOvertimeController>(
      () => SubmissionOvertimeController(),
    );
  }
}
