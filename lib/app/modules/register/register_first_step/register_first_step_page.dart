import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFirstStepPage extends StatelessWidget {
  const RegisterFirstStepPage({super.key});

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
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('phone number'),
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
                onPressed: () => Get.toNamed('/register-second-step'),
                child: const Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
