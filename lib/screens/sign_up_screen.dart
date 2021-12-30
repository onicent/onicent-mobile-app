import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onicent/models/sign_up/list_of_country_model.dart';

import '../utilities/locales/flutter_locales.dart';
import '../widgets/button_press.dart';
import '../widgets/empty_screen.dart';
import '../widgets/text_field_input.dart';
import '../services/api/sign_up/list_of_country.dart';

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

  List<ListOfCountryModel>? dataListOfCountry;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: const Text(''),
      ),
      padding: const EdgeInsets.all(15.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Locales.string(context, 'select_country'),
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20.0),
          TextFieldInput(
            leading: const Icon(Icons.search),
            hintText: Locales.string(context, 'search'),
          ),
          const SizedBox(height: 15.0),
          Flexible(
            child: Container(
              height: double.infinity,
              child: ListView(
                children: [
                  InkWell(
                    onTap: () => Get.to(InputName()),
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
                            'assets/images/flags/vn.png',
                            width: 24.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Việt Nam',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(InputName()),
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
                          Text(
                            'Việt Nam',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(InputName()),
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
                          Text(
                            'Việt Nam',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(InputName()),
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
                          Text(
                            'Việt Nam',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(InputName()),
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
                          Text(
                            'Việt Nam',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputName extends StatelessWidget {
  const InputName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text(''),
      ),
      padding: EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tên của bạn là gì?',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Vui lòng nhập họ tên đầy đủ.',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextFieldInput(
            hintText: 'Nhập họ tên đầy đủ',
          ),
          SizedBox(
            height: 40.0,
          ),
          ButtonPress(
            onPress: () => Get.to(SignUp()),
            title: 'Tiếp tục',
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text(''),
      ),
      padding: EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đăng ký',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Sử dụng số điện thoại hoặc email.',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextFieldInput(
            hintText: 'Nhập số điện thoại',
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFieldInput(
            hintText: 'Nhập mật khẩu',
          ),
          SizedBox(
            height: 40.0,
          ),
          ButtonPress(
            onPress: () => Get.to(VerifyAccount()),
            title: 'Đăng ký',
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
