import 'package:flutter/material.dart';

class WrapCard extends StatefulWidget {
  final Function()? onTab;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? backgroundColor;

  const WrapCard({
    Key? key,
    this.onTab,
    this.height,
    this.width,
    this.padding,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<WrapCard> createState() => _WrapCardState();
}

class _WrapCardState extends State<WrapCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onTab,
        child: Ink(
          height: widget.height,
          width: widget.width,
          padding: widget.padding?? const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
              color: widget.backgroundColor ?? Theme.of(context).colorScheme.background,
              border: const Border.symmetric(
                horizontal: BorderSide(width: 0.5, color: Color(0xFFF5F4F4)),
                vertical: BorderSide(width: 0.3, color: Color(0xFFF5F4F4)),
              ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
