import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NameController extends GetxController {
  String name;

  void setName(nameSent) {
    name = nameSent;
    update();
  }
}
