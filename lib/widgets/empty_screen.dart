/*
* Author: Y DŨNG KUAN.
* Description: This is a blank screen of the application suite.
* Day month Year: 18 - 11 - 2021.
*/

import 'package:flutter/material.dart';

class EmptyScreen extends StatefulWidget {
  final String title;
  final List<Widget>? tabBarAction;
  final bool iconBack;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final AppBar? appBar;
  final Widget? body;

  const EmptyScreen({
    Key? key,
    this.title = '',
    this.tabBarAction,
    this.iconBack = true,
    this.titleFontSize = 18.0,
    this.titleFontWeight = FontWeight.w400,

    this.padding,
    this.margin,
    this.decoration,
    this.appBar,
    this.body,
  }) : super(key: key);

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      // GestureDetector if tab outside TextField then hidden keyboard.
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          padding: widget.padding,
          margin: widget.margin,
          decoration: widget.decoration,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: widget.body,
        ),
      ),
    );
  }
}
