import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat/app/models/user.dart';
import 'package:mychat/app/modules/auth/register/register_third_step/register_third_step_controller.dart';

class RegisterThirdStepPage extends StatefulWidget {
  const RegisterThirdStepPage({super.key});

  @override
  State<RegisterThirdStepPage> createState() => _RegisterThirdStepPageState();
}

class _RegisterThirdStepPageState extends State<RegisterThirdStepPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordEc = TextEditingController();
  final _usernameEc = TextEditingController();
  final controller = Get.put(RegisterThirdStepController());

  @override
  void dispose() {
    _usernameEc.dispose();
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
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: _usernameEc,
                    decoration: const InputDecoration(
                      label: Text('username'),
                    ),
                    maxLength: 25,
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
                    controller: _passwordEc,
                    decoration: const InputDecoration(
                      label: Text('password'),
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
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.register(
                        User(
                            username: _usernameEc.text,
                            password: _passwordEc.text,
                            phoneNumber: controller.phone),
                      );
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
