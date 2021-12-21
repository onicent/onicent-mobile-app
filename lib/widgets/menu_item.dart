import 'package:flutter/material.dart';

// This is widget item
class MenuItem extends StatefulWidget {
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

  const MenuItem({
    Key? key,
    this.leading,
    required this.title,
    this.subTitle = '',
    this.trailing,
    this.onTap,
    this.decoration,
    this.height,
    this.arrow = true,
    this.borderTop = false,
    this.borderBottom = false,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      constraints: const BoxConstraints(minHeight: 60.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: widget.borderTop ? 1.0 : 0.0,
            color: Color(0xFFF3F3FF),
          ),
          bottom: BorderSide(
            width: widget.borderBottom ? 1.0 : 0.0,
            color: Color(0xFFF3F3FF),
          ),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                        widget.subTitle != ''
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.subTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      height: 1.3,
                                      fontSize: 14.0,
                                      color: Colors.black54),
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
