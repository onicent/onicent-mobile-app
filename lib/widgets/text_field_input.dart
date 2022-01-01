import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final String? hintText;
  bool obscureText;
  final Widget? icon;
  final TextEditingController? controller;

  final Widget? leading;
  final double? leadingWidth;
  final Color? leadingBackground;
  final Widget? trailing;
  final double? trailingWidth;
  final Color? trailingBackground;

  final double borderRadius;
  final bool enabled;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  TextFieldInput({
    Key? key,
    this.icon,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.borderRadius = 50.0,
    this.leading,
    this.leadingWidth,
    this.leadingBackground,
    this.trailing,
    this.trailingWidth,
    this.trailingBackground,
    this.enabled = true,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.2),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: widget.leadingWidth,
            padding: EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              color: widget.leadingBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.borderRadius),
                bottomLeft: Radius.circular(widget.borderRadius),
              ),
            ),
            child: widget.leading,
          ),
          widget.leading != null ? SizedBox(width: 10.0) : SizedBox(width: 0.0),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextField(
                // textAlignVertical: TextAlignVertical.center,
                // textAlign: TextAlign.left,
                keyboardType: widget.keyboardType,
                onChanged: widget.onChanged,
                enabled: widget.enabled,
                obscureText:
                    widget.obscureText ? _isObscure : widget.obscureText,
                style: const TextStyle(fontSize: 16.0),
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  hintMaxLines: 1,
                  border: InputBorder.none,
                  hintText: widget.hintText,
                ),
                controller: widget.controller,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: widget.trailingWidth,
            padding: EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              color: widget.trailingBackground,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(widget.borderRadius),
                bottomRight: Radius.circular(widget.borderRadius),
              ),
            ),
            child: Row(
              children: [
                SizedBox(child: widget.trailing),
                widget.obscureText
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 25.0,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Container(width: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldTypeA extends StatefulWidget {
  const TextFieldTypeA({Key? key}) : super(key: key);

  @override
  State<TextFieldTypeA> createState() => _TextFieldTypeAState();
}

class _TextFieldTypeAState extends State<TextFieldTypeA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Color(0xFFEFF2F6), width: 1.0)),
      child: Row(
        children: [
          InkWell(
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/crypto/Ripple-icon.png',
                  width: 22.0,
                ),
                SizedBox(width: 5.0),
                Text('BTC'),
                SizedBox(width: 5.0),
                Icon(
                  Icons.expand_more,
                  size: 20.0,
                ),
                SizedBox(width: 5.0),
                Container(
                  color: Color(0xFFEFF2F6),
                  width: 1.0,
                  height: 30.0,
                ),
              ],
            ),
          ),
          SizedBox(width: 5.0),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldTypeC extends StatefulWidget {
  const TextFieldTypeC({Key? key}) : super(key: key);

  @override
  _TextFieldTypeCState createState() => _TextFieldTypeCState();
}

class _TextFieldTypeCState extends State<TextFieldTypeC> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
