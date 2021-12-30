import 'package:flutter/material.dart';
import 'package:onicent/widgets/widgets.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Tin tức'),

      ),
    );
  }
}
