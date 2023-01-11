import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/modules/register/register_second_step/register_second_step_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class RegisterSecondStepPage extends GetView<RegisterSecondStepController> {
  const RegisterSecondStepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final grey = Colors.grey[300];
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        title: Text(
          'register',
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: grey,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => SizedBox(
                  width: width * 0.8,
                  child: PinFieldAutoFill(
                    controller: controller.codigoEc,
                    currentCode: controller.messageCode.value,
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) {
                      controller.messageCode.value = code!;
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: SizedBox(
              width: width * 0.3,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Confirm'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
