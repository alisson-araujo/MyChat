import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFirstStepPage extends StatefulWidget {
  const RegisterFirstStepPage({super.key});

  @override
  State<RegisterFirstStepPage> createState() => _RegisterFirstStepPageState();
}

class _RegisterFirstStepPageState extends State<RegisterFirstStepPage> {
  final _phoneEc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneEc.dispose();
    super.dispose();
  }

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
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: _phoneEc,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('phone number'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: SizedBox(
              width: width * 0.3,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Get.toNamed('/register-third-step',
                        arguments: _phoneEc.text);
                  }
                },
                child: const Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
