import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'package:bitnet/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {

  @override
  void initState (){
    super.initState();
    // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    _nextScreen();
  }
  void dispose() {
    super.dispose();
    // Exit full screen
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  _nextScreen() async{
    await Future.delayed(Duration(milliseconds: 3500), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff023e82),
      body: Center(
        child: Container(
          child: Text('Megacoin', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}
