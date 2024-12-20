import 'package:get/get.dart';

import '../controllers/location_maps_controller.dart';

class LocationMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationMapsController>(() => LocationMapsController());
  }
}
