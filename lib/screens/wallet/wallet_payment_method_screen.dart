import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class WalletPaymentMethodScreen extends StatefulWidget {
  const WalletPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _WalletPaymentMethodScreenState createState() => _WalletPaymentMethodScreenState();
}

class _WalletPaymentMethodScreenState extends State<WalletPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Phương thức thanh toán',
    );
  }
}
