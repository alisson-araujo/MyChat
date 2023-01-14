import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterThirdStepPage extends StatelessWidget {
  const RegisterThirdStepPage({super.key});

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('username'),
                  ),
                  maxLength: 25,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: SizedBox(
              width: width * 0.3,
              child: ElevatedButton(
                onPressed: () => Get.offAllNamed('/conversations'),
                child: const Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
