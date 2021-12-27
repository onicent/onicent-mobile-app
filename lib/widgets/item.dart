import 'package:flutter/material.dart';

// This is widget item
class Item extends StatefulWidget {
  final Widget? leading;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final Function()? onTap;
  final BoxDecoration? decoration;
  final double? height;
  final bool arrow;
  final bool borderTop;
  final bool borderBottom;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Color? backgroundColor;

  const Item({
    Key? key,
    this.leading,
    this.title ='',
    this.subTitle = '',
    this.trailing,
    this.onTap,
    this.decoration,
    this.height,
    this.arrow = true,
    this.borderTop = false,
    this.borderBottom = false,
    this.titleStyle,
    this.subTitleStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 58,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: widget.borderTop ? 1.0 : 0.0,
            color: widget.borderTop ? Color(0xFFF3F3FF): Colors.transparent,
          ),
          bottom: BorderSide(
            width: widget.borderBottom ? 1.0 : 0.0,
            color: widget.borderBottom ? Theme.of(context).dividerColor : Colors.transparent,
          ),
        ),
        color: widget.backgroundColor?? Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          children: [
            Container(
              child: widget.leading,
            ),
            widget.leading != null
                ? const SizedBox(width: 10.0)
                : const SizedBox(),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: widget.titleStyle ?? const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        widget.subTitle != ''
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.subTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: widget.subTitleStyle ?? const TextStyle(
                                      height: 1.3,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    child: widget.trailing,
                  )
                ],
              ),
            ),
            widget.arrow
                ? Row(
                    children: const [
                      SizedBox(width: 6.0),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF8D8C8C),
                        size: 14,
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
