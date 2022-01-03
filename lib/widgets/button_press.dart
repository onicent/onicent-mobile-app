import 'package:flutter/material.dart';

class ButtonPress extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onPress;
  final double? height;
  final double? width;
  final double borderRadius;
  final Widget? child;
  final bool isButtonDisabled;

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
    this.isButtonDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isButtonDisabled ? null : onPress,
      borderRadius: BorderRadius.circular(borderRadius),
      splashColor: Colors.blue[900],
      child: Ink(
        height: height ?? 48.0,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: isButtonDisabled ? Colors.grey :  backgroundColor ?? Color(0xFF1f47cd),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: child ?? Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
