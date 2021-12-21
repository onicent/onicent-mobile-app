import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final String? title;
  bool obscureText;
  final Widget? icon;
  final TextEditingController? controller;

  TextFieldInput({
    Key? key,
    this.icon,
    this.title,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: const Color(0xFFF7F7FF)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: widget.icon == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: widget.icon,
                  ),
          ),
          Flexible(
            child: Center(
              child: TextField(
                obscureText:
                    widget.obscureText ? _isObscure : widget.obscureText,
                style: const TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.title,
                ),
                controller: widget.controller,
              ),
            ),
          ),
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
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      size: 25.0,
                      color: Colors.grey,
                    ),
                  ),
                )
              : Container(),
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
          border: Border.all(
              color: Color(0xFFEFF2F6), width: 1.0)),
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


