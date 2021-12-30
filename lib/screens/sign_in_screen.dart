import 'package:get/get.dart';
import 'package:onicent/screens/forgot_password_screen.dart';
import 'package:onicent/screens/sign_up_screen.dart';
import 'package:onicent/theming/theme_manager.dart';
import 'package:onicent/widgets/main_container.dart';
import 'package:onicent/widgets/route_render.dart';
import 'package:flutter/material.dart';
import 'package:onicent/widgets/empty_screen.dart';
import 'package:provider/provider.dart';
import '../utilities/locales/flutter_locales.dart';

import 'package:http/http.dart';

import '../widgets/text_field_input.dart';
import '../widgets/button_press.dart';

import 'package:badges/badges.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoggedIn = false;

  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch('email');

  void Login(){
  }
  RxBool isDarkMode = true.obs;

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<ThemeNotifier>(context);

    return EmptyScreen(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              isDarkMode == true? isDarkMode = false.obs:  isDarkMode =true.obs;
              isDarkMode == true ? thmode.setLightMode() : thmode.setDarkMode();
            },
            icon: isDarkMode == true?  Icon(Icons.dark_mode, color: Colors.black54) : Icon(Icons.light_mode),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35.0),
              Text(
                Locales.string(context, 'sign_in'),
                style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 20.0),
              TextFieldInput(
                leading: Icon(Icons.person, size: 25.0),
                hintText: Locales.string(context, 'email_or_phone'),
                controller: _userController,
              ),
              const SizedBox(height: 20.0),
              TextFieldInput(
                leading: const Icon(Icons.lock, size: 25.0),
                hintText: Locales.string(context, 'password'),
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 20.0),
              InkWell(
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
              const SizedBox(height: 40.0),
              ButtonPress(
                onPress: () {
                  Navigator.of(context).push(createRoute(MainContainer()));
                },
                backgroundColor: Color(0xFF1f47cd),
                title: Locales.string(context, 'sign_in'),
              ),
            ],
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Locales.change(context, 'vi');
                    },
                    child: Badge(
                      showBadge: Locales.string(context, 'localization') == 'vi' ? true: false,
                      padding: EdgeInsets.all(2.0),
                      position: BadgePosition.topEnd(top: -4,end: -4),
                      badgeColor: Colors.white,
                      badgeContent: Icon(
                        Icons.done,
                        size: 13.0,
                        color: Colors.black54,
                      ),
                      child: CircleAvatar(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          height: 37.0,
                          width: 37.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage('assets/icons/flag/VI.png'),
                                fit: BoxFit.cover,
                                scale: 1
                            ),
                          ),
                          child: null /* add child content here */,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  InkWell(
                    onTap: () {
                      Locales.change(context, 'en');
                    },
                    child: Badge(
                      showBadge: Locales.string(context, 'localization') == 'en' ? true: false,
                      padding: EdgeInsets.all(2.0),
                      position: BadgePosition.topEnd(top: -4,end: -4),
                      badgeColor: Colors.white,
                      badgeContent: Icon(
                        Icons.done,
                        size: 13.0,
                        color: Colors.black54,
                      ),
                      child: CircleAvatar(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          height: 37.0,
                          width: 37.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage('assets/icons/flag/EN.png'),
                                fit: BoxFit.cover,
                                scale: 1
                            ),
                          ),
                          child: null /* add child content here */,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Locales.string(context, 'dont_have_an_account'),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(createRoute(const SignUpScreen()));
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
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
