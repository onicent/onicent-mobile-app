/*
* Author: Y DŨNG KUAN.
* Description: This is a blank screen of the application suite.
* Day month Year: 18 - 11 - 2021.
*/

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatefulWidget {
  final String title;
  final Widget? body;
  final List<Widget>? tabBarAction;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final bool iconBack;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Widget? appBar;

  const EmptyScreen({
    Key? key,
    this.title = '',
    this.body,
    this.tabBarAction,
    this.padding,
    this.margin,
    this.decoration,
    this.iconBack = true,
    this.titleFontSize = 18.0,
    this.titleFontWeight = FontWeight.w400,
    this.appBar,
  }) : super(key: key);

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.primary,
    ));
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F5),
      appBar: widget.appBar != null
          ? AppBar(
              elevation: 0.0,
              flexibleSpace: widget.appBar,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              centerTitle: true,
              elevation: 0.0,
              leading: widget.iconBack
                  ? IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  : Container(),
              // automaticallyImplyLeading: widget.iconBack,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: widget.titleFontSize,
                      fontWeight: widget.titleFontWeight,
                    ),
                  ),
                ],
              ),
              actions: widget.tabBarAction,
            ),
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
          // child: SingleChildScrollView(
          //   physics: const BouncingScrollPhysics(),
          //   child: widget.child,
          // ),
        ),
      ),
    );
  }
}

class BlankScreen extends StatefulWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;

  const BlankScreen({
    Key? key,
    this.child,
    this.padding,
    this.margin,
    this.decoration,
  }) : super(key: key);

  @override
  State<BlankScreen> createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Container(
            padding: widget.padding,
            margin: widget.margin,
            decoration: widget.decoration,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
