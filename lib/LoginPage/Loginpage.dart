import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _usernameController = TextEditingController();
  final _PasswordController = TextEditingController();

Future<void> _login() async {
 final url = Uri('') //API ต้องใส่
 final header = {'Content-Type':'application/json'};
 final body = jsonEncoder({
  'username': _usernameController.text,
  'password': _PasswordController.text
 });

 final Response = await http.post(url )
}


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Images/logo.png',
                              width: 300,
                              height: 300,
                            ),
                            TextFormField(
                              controller: _usernameController,
                              decoration:
                                  const InputDecoration(labelText: 'Username'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Username';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _PasswordController,
                              obscureText: true,
                              decoration:
                                  const InputDecoration(labelText: 'password'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {}
                                },
                                child: const Text('Login'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
