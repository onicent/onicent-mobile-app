import 'package:bitnet/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import '../utilities/locales/flutter_locales.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: Locales.string(context, 'password_recovery'),
      body: Container(
        // height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Locales.string(context, 'forgot_password_attention'),
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              height: 56.0,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Color(0xFFF7F7FF)),
                color: Colors.white,
              ),
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Locales.string(context, 'email_or_phone'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3771D5),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    Locales.string(context, 'password_recovery'),
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
