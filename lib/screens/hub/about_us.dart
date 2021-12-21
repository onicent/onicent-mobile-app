/*
* Author: Y DŨNG KUAN.
* Description: About screen.
* Day month Year: 18 - 11 - 2021.
*/

import 'package:flutter/material.dart';
import 'package:onicent/widgets/empty_screen.dart';

class AboutUsScreen extends StatelessWidget {
  final String _title = 'Giới Thiệu Sơ Lược Về Công Ty';
  final String _content =
      '\nBitnet cung cấp thị trường P2P Bitcoin ký quỹ nơi mọi người mua và bán '
      'Bitcoin dễ dàng và an toàn với giao diện người dùng đơn giản đáng chú ý, hỗ '
      'trợ khách hàng trực tuyến thân thiện 24/7 và mức phí thấp nhất so với các '
      'công ty lớn trên thị trường. Nhóm của chúng tôi chủ yếu bao gồm các chuyên '
      'gia ngân hàng có nhiều kinh nghiệm trong các sản phẩm tài chính, tiền điện tử, '
      'Hệ thống thanh toán và Phát triển phần mềm Agile, và những người khác. '
      '\n\nHiện tại, Bitnet được cung cấp và sử dụng tại nhiều quốc gia như '
      'Malaysia, Nigeria, Việt Nam, Cambodia, Trung Quốc và đang được phát triển '
      'và mở rộng mỗi ngày.'
      '\n\nHiện tại, Bitnet được cung cấp và sử dụng tại nhiều quốc gia như '
      'Malaysia, Nigeria, Việt Nam, Cambodia, Trung Quốc và đang được phát triển '
      'và mở rộng mỗi ngày.'
      '\n\nHãy liên hệ với chúng tôi theo các kênh email như sau:\n'
      '\n• support@Bitnet.asian: nếu bạn cần hỗ trợ về đơn hàng hoặc giao dịch.'
      '\n• support@Bitnet.asian: nếu bạn là cơ quan thực thi pháp luật.'
      '\n• marketing@Bitnet.asian: nếu bạn muốn liên hệ hợp tác về truyền thông.'
      '\n\n© copyright Bitnet 2018 - 2021';

  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Thông tin về chúng tôi',
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      body: Column(
        children: [
          SelectableText(
            _title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          SelectableText(
            _content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
            // maxLines: 100,
          ),
        ],
      ),
    );
  }
}
