import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onicent/models/sign_up/list_of_country_model.dart';
import 'package:onicent/screens/sign_in_screen.dart';
import 'package:onicent/services/api/sign_up/sign_up.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../utilities/locales/flutter_locales.dart';
import '../widgets/widgets.dart';
import '../controllers/sign_up_controller.dart';

import 'package:timer_count_down/timer_count_down.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  // Call and use DataSignUp controller
  _SignUpData signUpData = Get.put(_SignUpData()); // Store country to class

  void nextScreen() {
    signUpData.clear();
    Get.to(_ChooseCountry());
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: const Text(''),
      ),
      padding: const EdgeInsets.all(15.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Locales.string(context, 'title_fist_screen_sign_up'),
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20.0),
          Text(
            Locales.string(context, 'content_fist_screen_sign_up'),
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          const SizedBox(height: 40.0),
          ButtonPress(
            onPress: () => nextScreen(),
            title: Locales.string(context, 'sign_up'),
          ),
          const SizedBox(height: 20.0),
          ButtonPress(
            onPress: () => Get.back(),
            title: Locales.string(context, 'sign_in'),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class _ChooseCountry extends StatelessWidget {
  // Call and use SingUp controller
  SignUpController signUpController = Get.put(SignUpController());
  _SignUpData signUpData = Get.put(_SignUpData()); // Store country to class

  // Function set country and next screen
  void nextScreen(String country) {
    // Set country to class data
    signUpData.countryCode.value = country;
    // Refresh and checked after item
    signUpController.listCountry.refresh();
    Get.to(() => _InputName());
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Locales.string(context, 'select_country'),
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15.0),
          TextFieldInput(
            leading: const Icon(Icons.search),
            hintText: Locales.string(context, 'search'),
            onChanged: (text) {
              // Call function search from class Sign Up controller
              signUpController.searchCountry(text.toLowerCase());
            },
          ),
          const SizedBox(height: 15.0),
          Flexible(
            child: Obx(
              () => FutureBuilder<List<ListOfCountryModel>>(
                future: signUpController.listCountry.value,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) => Item(
                        height: 60.0,
                        borderBottom: true,
                        arrow: false,
                        leading: Image.asset(
                          'assets/images/flags/${snapshot.data![index].flag}',
                          width: 24.0,
                        ),
                        title: '${snapshot.data![index].country}',
                        onTap: () {
                          nextScreen(snapshot.data![index].code.toString());
                        },
                        trailing: signUpData.countryCode.value ==
                                snapshot.data![index].code.toString()
                            ? const Icon(
                                Icons.check_circle,
                                size: 20.0,
                                color: Colors.green,
                              )
                            : null,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputName extends StatelessWidget {
  _SignUpData signUpData =
      Get.put(_SignUpData()); // Call Store country to class

  TextEditingController? fullName = TextEditingController();

  // Conditional full name length
  RxBool isButtonDisabled = true.obs;

  // Function disable tab button if do not input text from field
  void onChangedText(String text) {
    // Replace all space in string
    String result = text.replaceAll(RegExp(' +'), '');

    if (result != '' && result.length > 2) {
      // text.replaceAll(' ', '');
      isButtonDisabled.value = false;
    } else {
      isButtonDisabled.value = true;
    }
  }

  // Function set country and next screen
  void nextScreen() {
    // Set full name to class data
    signUpData.fullName.value = fullName!.text;
    Get.to(() => _SignUp());
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: const Text(''),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Locales.string(context, 'what_your_name'),
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10.0),
          Text(
            Locales.string(context, 'please_input_full_name'),
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          const SizedBox(height: 40.0),
          Obx(
            () => Container(
              height: 20.0,
              child: isButtonDisabled.isTrue
                  ? const Text(
                      'Tên phải trên 3 ký tự',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    )
                  : null,
            ),
          ),
          TextFieldInput(
            hintText: Locales.string(context, 'input_full_name'),
            controller: fullName,
            onChanged: (text) {
              onChangedText(text);
            },
          ),
          const SizedBox(height: 40.0),
          Obx(() => ButtonPress(
                onPress: () => nextScreen(),
                title: Locales.string(context, 'next'),
                isButtonDisabled: isButtonDisabled.value,
              )),
        ],
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  // Call and use SingUp controller
  SignUpController signUpController = Get.put(SignUpController());
  _SignUpData signUpData = Get.put(_SignUpData()); // Store country to class

  TextEditingController? phoneNumber = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  RxBool isUseEmailToSignUp = false.obs;
  RxBool ifConditionalTrue = false.obs;
  RxBool isButtonDisabled = false.obs;

  RxBool conditionalPhoneOrEmail = true.obs;
  RxBool conditionalPassword = false.obs;

  void onChangedEmail(String text) {
    signUpData.email.value = text;
    print(signUpData.email.value);
  }

  void onChangedPhone(String text) {
    signUpData.phoneNumber.value = text;
    print(signUpData.phoneNumber.value);
  }

  void onChangedPassword(String text) {
    signUpData.password.value = text;
    isButtonDisabled.value == false;

    if (text.length > 0) {
      conditionalPassword.value = true;
      isButtonDisabled.value == false;
    }

    if (conditionalPhoneOrEmail == true && conditionalPassword == true) {
      isButtonDisabled.value == false;
    }
    isButtonDisabled.value == false;
    isButtonDisabled.refresh();
    print(signUpData.password.value);
  }

  void signUp() {
    isUseEmailToSignUp.isTrue ? phoneNumber : email;
    print(signUpData.countryCode);
    print(signUpData.fullName);
    print(email!.text);
    print(phoneNumber!.text);
    print(password!.text);
    // print(country);
    if (isUseEmailToSignUp.value) {
      Get.to(_BackToSignIn(isSignUpByEmail: true));
    } else {
      // Use a number phone to sign up
      // Get.to(_BackToSignIn(isSignUpByEmail: false));
      Get.to(_VerifyAccount());
    }

    // SignUpProvider().signUp(
    //     'ydungkuan@gmail.com', '84372788066', 'asdsad', 'ydungkuan', '84');
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text(''),
      ),
      padding: const EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Locales.string(context, 'sign_up'),
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10.0),
          Text(
            Locales.string(context, 'using_phone_or_mail'),
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  isUseEmailToSignUp.value = !isUseEmailToSignUp.value;
                },
                child: Obx(() => Text(
                      isUseEmailToSignUp.isFalse
                          ? Locales.string(context, 'using_email')
                          : Locales.string(context, 'using_phone'),
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.blue),
                    )),
              )
            ],
          ),
          Obx(
            () => TextFieldInput(
              leading: isUseEmailToSignUp.isTrue
                  ? Row(
                      children: [Icon(Icons.mail), Text('')],
                    )
                  : Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 5.0),
                        Text(
                          '+${signUpData.countryCode}',
                          style: TextStyle(fontSize: 16.0),
                        )
                      ],
                    ),
              keyboardType: isUseEmailToSignUp.isTrue
                  ? TextInputType.emailAddress
                  : TextInputType.number,
              hintText: isUseEmailToSignUp.isTrue
                  ? 'Email'
                  : Locales.string(context, 'phone'),
              controller: isUseEmailToSignUp.isTrue ? email : phoneNumber,
              onChanged: isUseEmailToSignUp.isTrue
                  ? (text) => onChangedEmail(text)
                  : (text) => onChangedPhone(text),
            ),
          ),
          const SizedBox(height: 20.0),
          TextFieldInput(
            leading: Icon(Icons.lock),
            hintText: Locales.string(context, 'password'),
            controller: password,
            obscureText: true,
            onChanged: (text) => onChangedPassword(text),
          ),
          const SizedBox(height: 40.0),
          Obx(() => ButtonPress(
                onPress: () => signUp(),
                title: Locales.string(context, 'sign_up'),
                isButtonDisabled: isButtonDisabled.value,
              )),
        ],
      ),
    );
  }
}

class _VerifyAccount extends StatelessWidget {

  final int _otpTimeResend = 5;
  final RxBool _isResend = false.obs;
  final CountdownController _otpResendCountdownController = CountdownController(autoStart: true);

  void _resendOTP() {
    _isResend.value = !_isResend.value;
    _otpResendCountdownController.restart();
  }

  void _verifyOTP() {
    // Get.to();

    Get.to(const _BackToSignIn(isSignUpByEmail: false));
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Xác thực số điện thoại'),
      ),
      padding: EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Hãy nhập mã xác minh 5 chữ số \n dã được gửi đến số điện thoại \n 037***8055.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(height: 20.0),
          TextFieldInput(
            textAlign: TextAlign.center,
            hintText: 'Input OTP',
            keyboardType: TextInputType.number,
            hintStyle: TextStyle(fontSize: 16.0),
          ),

          SizedBox(
            height: 20.0,
          ),
          ButtonPress(
            onPress: () => _verifyOTP(),
            title: 'Xác minh',
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bạn chưa nhận được mã xác thực? ',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Countdown(
                controller: _otpResendCountdownController,
                seconds: _otpTimeResend,
                build: (_, double time) => Obx(
                    () => InkWell(
                      onTap: _isResend.isTrue ? () => _resendOTP() : null,
                      child: Text(
                        'Gửi lại (${time.toInt()}).',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[900]
                        ),
                      ),
                    )
                ),
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  // On finish countdown
                  _isResend.value = !_isResend.value;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackToSignIn extends StatelessWidget {
  const _BackToSignIn({Key? key, this.isSignUpByEmail = true})
      : super(key: key);
  final bool isSignUpByEmail;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30.0),
          if (isSignUpByEmail)
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/success-icon.png',width: 100.0),

                  SizedBox(height: 20.0),

                  Text(
                    'Yêu cầu xác thực email',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Vui lòng kiểm tra hòm thư để xác thực tài khoản và bắt đầu đăng nhập',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          if (isSignUpByEmail == false)
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/success-icon.png',width: 100.0),
                  SizedBox(height: 20.0),
                  Text(
                    'Bạn đã đăng ký thành công',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Vui lòng trở lại trang đăng nhập để sử dụng dịch vụ.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ButtonPress(
            title: 'Đăng nhập',
            onPress: () => Get.offAll(const SignInScreen()),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

class _SignUpData extends GetxController {
  var countryCode = "".obs;
  var fullName = "".obs;
  var phoneNumber = "".obs;
  var email = "".obs;
  var password = "".obs;

  void clear() {
    countryCode.value = '';
    fullName.value = '';
    phoneNumber.value = '';
    email.value = '';
    password.value = '';
  }

  void updateData({countryCode, fullName, phoneNumber, email, password}) {
    this.countryCode.value = countryCode;
    this.fullName.value = fullName;
    this.phoneNumber.value = phoneNumber;
    this.email.value = email;
    this.password.value = password;
  }
}
