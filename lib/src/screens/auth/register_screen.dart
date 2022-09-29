import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constants/now_ui_colors.dart';
import '../../widgets/base/base.dart';
import '../../widgets/now_ui/now.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  bool? _checkboxValue = false;

  final double height = window.physicalSize.height;

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
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NowInput(
                                    margin: EdgeInsets.all(8),
                                    placeholder: 'Email...',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: 20,
                                    ),
                                  ),
                                  const NowInput(
                                    margin: EdgeInsets.all(8),
                                    placeholder: 'Password...',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 20,
                                    ),
                                    inputType: InputType.password,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                  text: 'Get Started',
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  },
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
