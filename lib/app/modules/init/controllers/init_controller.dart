import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class InitController extends GetxController {
  late final GetStorage _localStorage;

  GetStorage get localStorage => _localStorage;

  final isConnectedInternet = true.obs;

  final logger = Logger(printer: PrettyPrinter(printTime: true));

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  void _init() {
    _localStorage = GetStorage();
    // _localStorage.writeIfNull(ConstantsKeys.isFirstUsingApp, true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
