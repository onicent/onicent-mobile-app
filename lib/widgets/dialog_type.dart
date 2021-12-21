import 'package:flutter/material.dart';
import '../utilities/locales/locales.dart';

class DialogTypeA extends StatefulWidget {
  final String? title;
  final Function()? confirm;
  const DialogTypeA({
    Key? key,
    this.title,
    this.confirm,
  }) : super(key: key);

  @override
  State<DialogTypeA> createState() => _DialogTypeAState();
}

class _DialogTypeAState extends State<DialogTypeA> {
  String? get _title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280,
        height: 200,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  topLeft: Radius.circular(5.0),
                ),
                color: Colors.white,
              ),
              height: 120.0,
              child: Center(
                child: Text(
                  _title != null ? _title! : '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                    fontFamily: 'Typography',
                  ),
                ),
              ),
            ),
            Container(
              color: const Color(0xFFF1F1F1),
              height: 1.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.0,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(5.0)),
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          Locales.string(context, 'cancel'),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFFF1F1F1),
                  width: 1.0,
                  height: 50.0,
                ),
                Expanded(
                  child: Container(
                    height: 50.0,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(5.0)),
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          widget.confirm!();
                        },
                        child: Text(
                          Locales.string(context, 'confirm'),
                          style: const TextStyle(
                              color: Color(0xFF286DEA),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
