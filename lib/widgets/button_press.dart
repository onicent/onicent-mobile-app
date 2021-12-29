import 'package:flutter/material.dart';

class ButtonPress extends StatefulWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onPress;
  final double? height;
  final double? width;
  final double borderRadius;
  final Widget? child;


  const ButtonPress({
    Key? key,
    this.title = '',
    this.textColor,
    this.backgroundColor,
    this.onPress,
    this.height,
    this.width,
    this.borderRadius = 6.0,
    this.child,
  }) : super(key: key);

  @override
  State<ButtonPress> createState() => _ButtonPressState();
}

class _ButtonPressState extends State<ButtonPress> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      splashColor: Colors.blue[900],
      child: Ink(
        height: widget.height ?? 48.0,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Color(0xFF1f47cd),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: widget.child ?? Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
