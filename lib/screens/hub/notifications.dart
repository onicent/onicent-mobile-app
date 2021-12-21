import 'package:flutter/material.dart';
import '../../utilities/locales/flutter_locales.dart';

import 'package:bitnet/widgets/empty_screen.dart';
import 'package:bitnet/widgets/dialog_type.dart';

import '../../widgets/route_render.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: Locales.string(context, 'account_notification'),
      body: ListView(
        shrinkWrap: true,
        children: [
          _messageItem(
            status: true,
            title: 'Khám phá cơ hội giao dịch alimtrade kamikaze',
            date: '10.11.2021 07:33',
            content:
                'Giao dịch vàng ngoại hối kami kaze, tiền điện tử trên sàn giao dịch olimtradekeme chêka',
          ),
          _messageItem(
            status: false,
            title: 'Khám phá cơ hội giao dịch alimtrade kamikaze',
            date: '10.11.2021 07:33',
            content:
                'Giao dịch vàng ngoại hối kami kaze, tiền điện tử trên sàn giao dịch olimtradekeme chêka',
          ),
          _messageItem(
            messageId: '5487sass5',
            status: false,
            title: 'Khám phá cơ hội giao dịch alimtrade kamikaze',
            date: '10.11.2021 07:33',
            content:
                'Giao dịch vàng ngoại hối kami kaze, tiền điện tử trên sàn giao dịch olimtradekeme chêka',
          ),
        ],
      ),
    );
  }

  void _delMessage({messageId}) {
    print(messageId);
  }

  Widget _messageItem({
    Icon? icon,
    messageId,
    required bool? status,
    String? title,
    String? date,
    String? content,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(createRoute(_messageDetails(
          messageId: messageId,
          title: title!,
          date: date!,
          content: content!,
        )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFEEEFF3),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 40,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: const Color(0xFFD8E1EA),
              ),
              child: Icon(
                status! ? Icons.mail : Icons.drafts,
                color: const Color(0xFF7490C4),
                size: 28.0,
              ),
            ),
            const SizedBox(width: 15.0),
            Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: status ? Colors.black87 : Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                date!,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      content!,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        height: 1.15,
                        fontSize: 14,
                        color: status ? Color(0xFF636262) : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog({ String? title, Function()? confirm}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DialogTypeA(title: title, confirm: confirm);
      },
    );
  }

  Widget _messageDetails({
    messageId,
    String? title,
    String? date,
    String? content,
  }) {
    return EmptyScreen(
      title: Locales.string(context, 'account_notification'),
      tabBarAction: [
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Color(0xFF8D8C8C),
            size: 22,
          ),
          onPressed: () {
            _showDialog(title: Locales.string(context, 'title_del_message'), confirm: (){
              print('hello btccc');
            });
          },
          // _delMessage(messageId: messageId),
        ),
      ],
      body: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 25.0, bottom: 10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              title!,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4.0, bottom: 15.0),
              child: Text(
                date!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Text(
              content!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 100,
            ),
          ],
        ),
      ),
    );
  }
}
