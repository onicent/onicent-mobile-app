import 'package:bitnet/screens/forgot_password_screen.dart';
import 'package:bitnet/screens/register_screen.dart';
import 'package:bitnet/widgets/main_container.dart';
import 'package:bitnet/widgets/route_render.dart';
import 'package:flutter/material.dart';
import 'package:bitnet/widgets/empty_screen.dart';
import '../utilities/locales/flutter_locales.dart';

import 'package:http/http.dart';

import '../widgets/text_field_input.dart';
import '../widgets/button_press.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoggedIn = false;

  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch('email');

  final String _FlagVI = 'assets/icons/flag/VI.png';
  final String _FlagEN = 'assets/icons/flag/EN.png';
  bool _lang = true;

  void Login(){
  }

  @override
  Widget build(BuildContext context) {
    return BlankScreen(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _lang = !_lang;
                        });
                        if (_lang == true) {
                          Locales.change(context, 'vi');
                        }
                        if (_lang == false) {
                          Locales.change(context, 'en');
                        }
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            _lang ? _FlagEN : _FlagVI,
                            width: 16.0,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                              _lang ? 'EN' : 'VI',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      //_lang ? _VI : _EN,
                    ),
                  ],
                ),
                const SizedBox(height: 35.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Locales.string(context, 'sign_in'),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  icon: const Icon(Icons.person, size: 25.0),
                  title: Locales.string(context, 'email_or_phone'),
                  controller: _userController,
                ),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  icon: const Icon(Icons.lock, size: 25.0),
                  title: Locales.string(context, 'password'),
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(createRoute(const ForgotPasswordScreen()));
                    },
                    child: Text(
                      Locales.string(context, 'forgot_password'),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF2566C1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                ButtonC(
                  onPress: () {
                    Navigator.of(context).push(createRoute(MainContainer()));
                  },
                  title: Locales.string(context, 'sign_in'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Locales.string(context, 'Dont_have_an_account'),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(createRoute(const RegisterScreen()));
                  },
                  child: Text(
                    Locales.string(context, 'sign_up'),
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF2566C1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
