/*
* Author: Y DŨNG KUAN.
* Description: Statement and agreement screen app.
* Day month Year: 18 - 11 - 2021.
*/

import 'package:flutter/material.dart';
import 'package:bitnet/widgets/empty_screen.dart';

class StatementAndAgreementScreen extends StatelessWidget {
  final String _title = 'Điều khoản và chính sách';
  final String _content =
      '\nPhiên bản: 1.1 - Ngày có hiệu lực: 11/11/2021'
      'Bằng việc sử dụng trang web này, và tiếp tục bằng cách đăng ký sử '
      'dụng Dịch vụ của chúng tôi, bạn ("Bạn, các bạn'
      'hoặc bản thân bạn") đồng ý rằng bạn đã đủ 18 tuổi, chấp'
      'nhận và tuân thủ các điều khoản và điều kiện sử dụng đã'
      'nêu dưới đây ("Điều khoản sử dụng"). Bạn nên đọc toàn'
      'bộ Điều khoản sử dụng một cách cẩn thận trước khi sử '
      'dụng trang web này ("Trang web") hoặc bất kỳ các dịch vụ'
      'của của trang web. Tại đây, "Remitano" là Công ty, bao'
      'gồm nhưng không giới hạn: chủ sở hữu, giám đốc,'
      'các nhà đầu tư, nhân viên hoặc các bên liên quan khác. Tùy'
      'thuộc vào bối cảnh, "Remitano" cũng có thể tham khảo các'
      'dịch vụ, sản phẩm, trang web, nội dung hoặc các tài liệu '
      'khác (gọi chung là "Tài liệu") được cung cấp bởi Remitano.'
      'Dịch vụ điều hành bởi Remitano cho phép người mua'
      '("Người mua") và người bán ("Người bán") mua và bán '
      'đồng tiền Internet được gọi là "Bitcoin" (xem tại  http://bitcoin.org ).'
      '';

  const StatementAndAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Tuyên bố và thỏa thuận',
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
