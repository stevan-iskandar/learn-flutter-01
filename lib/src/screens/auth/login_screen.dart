import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learn_flutter_01/src/models/api/response/status422.dart';
import '../../constants/now_ui_colors.dart';
import '../../services/api/auth_api.dart';
import '../../widgets/base/index.dart';
import '../../widgets/now_ui/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final double height = window.physicalSize.height;

  String? email = '';
  String? password = '';
  bool? _checkboxValue = false;

  Map<String, dynamic>? loginErrors = {};

  final authUser = AuthApi();

  void handleLogin() async {
    setState(() {
      loginErrors = {};
    });

    final response = await authUser.login(
      email: email ?? '',
      password: password ?? '',
    );

    if (response.statusCode == 422) {
      final body = Status422.fromJSON(response.body);

      setState(() {
        loginErrors = body.errors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/register-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                BaseSizedBox(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  height: height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Container(
                          color: NowUIColors.bgColorScreen,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              const BaseCenter(
                                margin: EdgeInsets.only(
                                  top: 24,
                                  bottom: 8,
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NowInput(
                                    margin: const EdgeInsets.all(8),
                                    placeholder: 'Email...',
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      size: 20,
                                    ),
                                    error: loginErrors!['email'] != null,
                                    onChanged: (String? value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                  ),
                                  NowInput(
                                    margin: const EdgeInsets.all(8),
                                    placeholder: 'Password...',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 20,
                                    ),
                                    inputType: InputType.password,
                                    error: loginErrors!['password'] != null,
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                  ),
                                  BaseRow(
                                    margin: const EdgeInsets.all(8),
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        activeColor: NowUIColors.primary,
                                        onChanged: (bool? newValue) {
                                          setState(() {
                                            _checkboxValue = newValue;
                                          });
                                        },
                                        value: _checkboxValue,
                                      ),
                                      const Text(
                                        'I agree with the terms and conditions',
                                        style: TextStyle(
                                          color: NowUIColors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Center(
                                child: NowElevatedButton(
                                  margin: const EdgeInsets.only(
                                    top: 32,
                                    bottom: 32,
                                  ),
                                  width100: false,
                                  borderRadius: 32,
                                  paddingHorizontal: 32,
                                  text: 'Login',
                                  onPressed: handleLogin,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
