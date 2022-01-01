import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onicent/models/sign_up/list_of_country_model.dart';
import 'package:onicent/services/api/sign_up/sign_up.dart';

import '../utilities/locales/flutter_locales.dart';
import '../widgets/widgets.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
            onPress: () => Get.to(ChooseCountry()),
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

class ChooseCountry extends StatelessWidget {
  ChooseCountry({Key? key}) : super(key: key);

  // var search = ChooseCountryController().listOfCountryData.toList();
  // var data = ChooseCountryController().listOfCountryData.toList();

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());

    SignUpController signUpController = Get.put(SignUpController());

    return EmptyScreen(
      appBar: AppBar(),
      padding: const EdgeInsets.all(15.0),
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
              signUpController.searchCountry(text.toLowerCase());
            },
          ),
          const SizedBox(height: 15.0),
          Flexible(
            child:  Obx(
                ()=> FutureBuilder<List<ListOfCountryModel>>(
                  future: signUpController.listCountry.value,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => InkWell(
                              onTap: () {
                                Get.to(
                                  InputName(
                                      country: snapshot.data![index].code),
                                );
                              },
                              child: Ink(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context).dividerColor,
                                        width: 1.0),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/flags/${snapshot.data![index].flag}',
                                      width: 24.0,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      '${snapshot.data![index].country}',
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
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

class InputName extends StatelessWidget {
  InputName({Key? key, this.country}) : super(key: key);

  final String? country;
  TextEditingController? fullName = TextEditingController();

  void checkValue() {
    if (country == '') {
      print('vui longf nhaapj thanh pho');
    } else if (fullName!.text == '') {
      print('vui longf nhaapj teen');
    } else {
      Get.to(SignUp(country: country, fullName: fullName!.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: const Text(''),
      ),
      padding: const EdgeInsets.all(20.0),
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
          TextFieldInput(
            hintText: Locales.string(context, 'input_full_name'),
            controller: fullName,
          ),
          const SizedBox(height: 40.0),
          ButtonPress(
            onPress: () => checkValue(),
            title: Locales.string(context, 'next'),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  SignUp({Key? key, this.country, this.fullName}) : super(key: key);

  final String? country;
  final String? fullName;

  TextEditingController? phoneNumber = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  RxBool isPhoneNumber = true.obs;

  void signUp() {
    isPhoneNumber.isTrue ? phoneNumber : email;
    print(country);
    print(fullName);
    print(email!.text);
    print(phoneNumber!.text);
    print(password!.text);
    // print(country);
    // Get.to(VerifyAccount());

    SignUpProvider().signUp(
        'ydungkuan@gmail.com', '84372788066', 'asdsad', 'ydungkuan', '84');
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
                  isPhoneNumber.value = !isPhoneNumber.value;
                },
                child: Obx(() => Text(
                      isPhoneNumber.isFalse
                          ? Locales.string(context, 'phone')
                          : 'Email',
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.blue),
                    )),
              )
            ],
          ),
          Obx(
            () => TextFieldInput(
              keyboardType: isPhoneNumber.isTrue
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              hintText: isPhoneNumber.isTrue
                  ? Locales.string(context, 'phone')
                  : 'Email',
              controller: isPhoneNumber.isTrue ? phoneNumber : email,
            ),
          ),
          const SizedBox(height: 20.0),
          TextFieldInput(
            hintText: Locales.string(context, 'password'),
            controller: password,
            obscureText: true,
          ),
          const SizedBox(height: 40.0),
          ButtonPress(
            onPress: () => signUp(),
            title: Locales.string(context, 'sign_up'),
          ),
        ],
      ),
    );
  }
}

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({Key? key}) : super(key: key);

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
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Hãy nhập mã xác minh 5 chữ số \n dã được gửi đến số điện thoại \n 037***8055.',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFieldInput(
            hintText: 'Nhập số điện thoại',
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonPress(
            onPress: () => Get.to(BackToSignIn()),
            title: 'Xác minh',
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Bạn chưa nhận được mã xác thực? Gửi lại(53)',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class BackToSignIn extends StatelessWidget {
  const BackToSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text(''),
      ),
      padding: EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Hãy nhập mã xác minh 5 chữ số \n dã được gửi đến số điện thoại \n 037***8055.',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextFieldInput(
            hintText: 'Nhập số điện thoại',
          ),
          SizedBox(
            height: 30.0,
          ),
          ButtonPress(
            title: 'Đăng nhập',
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Bạn chưa nhận được mã xác thực? Gửi lại(53)',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SignUpData extends GetxController {
  var countryCode = "".obs;
  var fullName = "".obs;
  var phoneNumber = "".obs;
  var email = "".obs;
  var password = "".obs;

  updateData({countryCode, fullName, phoneNumber, email, password}) {
    this.countryCode.value = countryCode;
    this.fullName.value = fullName;
    this.phoneNumber.value = phoneNumber;
    this.email.value = email;
    this.password.value = password;
  }
}
