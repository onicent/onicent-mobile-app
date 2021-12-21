import 'package:flutter/material.dart';

class ButtonC extends StatefulWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onPress;
  final double? height;
  final double? width;

  const ButtonC({
    Key? key,
    this.title = '',
    this.textColor,
    this.backgroundColor,
    this.onPress,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<ButtonC> createState() => _ButtonCState();
}

class _ButtonCState extends State<ButtonC> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: widget.onPress,
      child: Ink(
        height: widget.height ?? 48.0,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? colorScheme.secondary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
