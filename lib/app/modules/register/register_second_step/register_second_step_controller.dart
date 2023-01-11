import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class RegisterSecondStepController extends GetxController {
  TextEditingController? codigoEc;
  RxString messageCode = ''.obs;
  

  @override
  void onInit() async {
    debugPrint(await SmsAutoFill().getAppSignature);
    await SmsAutoFill().listenForCode();
    super.onInit();
  }

  @override
  void onClose() {
    SmsAutoFill().unregisterListener();
    super.onClose();
  }

  
}
