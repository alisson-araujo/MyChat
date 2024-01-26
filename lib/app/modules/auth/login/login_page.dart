import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mychat/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordEc = TextEditingController();
  final _usernameEc = TextEditingController();
  final controller = Get.put(LoginController());

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
          'Login',
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
                      label: Text('phone number'),
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
                      controller
                          .login(_usernameEc.text, _passwordEc.text)
                          .then((response) {
                        response['success']
                            ? context.goNamed('/conversations')
                            : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response['message']),
                                ),
                              );
                      });
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
