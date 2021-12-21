import 'package:flutter/material.dart';
import 'package:bitnet/widgets/empty_screen.dart';

class TradingGuideScreen extends StatefulWidget {
  const TradingGuideScreen({Key? key}) : super(key: key);

  @override
  _TradingGuideScreenState createState() => _TradingGuideScreenState();
}

class _TradingGuideScreenState extends State<TradingGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(title: 'Hướng dẫn giao dịch', body: Container());
  }
}
