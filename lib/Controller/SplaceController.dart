
import 'package:car_paking_system/Controller/IotController.dart';
import 'package:car_paking_system/Pages/PakingSlotPage/ParkingSlotPage.dart';
import 'package:get/get.dart';

import '../Pages/GoogleMap/GoogleMap.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceHandle();
  }

  // AuthController authController = Get.put(AuthController());
  ParkingController1 parkingController1 = Get.put(ParkingController1());
  Future<void> splaceHandle() async {
    await parkingController1.initSlot();
    await Future.delayed(const Duration(seconds: 3));
    // if (authController.auth.currentUser != null) {

    // } else {
    //   Get.offAll(const LoginPage());
    // }


    Get.offAll(const ParkingSlotPage());
  }
}
