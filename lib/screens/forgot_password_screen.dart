import 'package:get/get.dart';
import 'package:onicent/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:onicent/widgets/widgets.dart';
import '../utilities/locales/flutter_locales.dart';
import 'sign_in_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text(Locales.string(context, 'password_recovery')),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),

      body: Column(
        children: [
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Locales.string(context, 'forgot_password_attention'),
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          TextFieldInput(
            hintText: Locales.string(context, 'email_or_phone'),
          ),

          SizedBox(height: 30.0),
          ButtonPress(
            onPress: () {
              Get.to(VerifyAccount());
            },
            backgroundColor: Color(0xFF1f47cd),
            title: Locales.string(context, 'password_recovery'),
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
        title: Text(''),
      ),
      padding: EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Xác thực OTP',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Hãy nhập mã xác minh 5 chữ số \n dã được gửi đến số điện thoại \n 037***8055.',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
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
            onPress: ()=>Get.to(ResetPassword()),
            title: 'Xác minh',
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Bạn chưa nhận được mã xác thực? Gửi lại(53)',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Khôi phục'),
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
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
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
          TextFieldInput(
            hintText: 'Nhập số điện thoại',
          ),
          SizedBox(
            height: 30.0,
          ),


          ButtonPress(
            onPress: ()=>Get.to(BackToSignIn()),
            title: 'Xác minh',
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Bạn chưa nhận được mã xác thực? Gửi lại(53)',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
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
        title: Text('Xác thực số điện thoại'),
      ),
      padding: EdgeInsets.all(20.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            height: 30.0,
          ),
          Text(
            'Mật khẩu đã được khôi phục thành công, vui lòng quy lại trang đăng nhập.',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey),
          ),

          SizedBox(
            height: 30.0,
          ),


          ButtonPress(
            onPress: ()=>Get.offAll(SignInScreen()),
            title: 'Quay lại đăng nhập',
          ),

        ],
      ),
    );
  }
}



