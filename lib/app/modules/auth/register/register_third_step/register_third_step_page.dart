import 'package:flutter/material.dart';

class RegisterThirdStepPage extends StatefulWidget {
  const RegisterThirdStepPage({super.key});

  @override
  State<RegisterThirdStepPage> createState() => _RegisterThirdStepPageState();
}

class _RegisterThirdStepPageState extends State<RegisterThirdStepPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameEc = TextEditingController();

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
                    decoration: const InputDecoration(
                      label: Text('username'),
                    ),
                    maxLength: 25,
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
                    //TODO: call function to register
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
