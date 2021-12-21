import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'star_rating.dart';
import 'package:intl/intl.dart';

class P2PItemList extends StatefulWidget {
  final bool isBuy;
  final bool isOnline;
  final bool isKYC;
  final String? userName;
  final double starRating;
  final Widget? cryptoIcon;
  final double? cryptoPrice;
  final String? cryptoName;
  final double? cryptoAmount;
  final String? basicMoney;
  final int? methodPayment;
  final Function()? onTab;

  const P2PItemList({
    Key? key,
    this.isBuy = false,
    this.isOnline = false,
    this.isKYC = false,
    this.userName,
    this.cryptoIcon,
    this.starRating = 0,
    this.cryptoPrice,
    this.cryptoName,
    this.cryptoAmount,
    this.basicMoney,
    this.methodPayment,
    this.onTab,
  }) : super(key: key);

  @override
  _P2PItemListState createState() => _P2PItemListState();
}

class _P2PItemListState extends State<P2PItemList> {
  final formatCurrency = NumberFormat("#,##0", "vi_VND");
  // final formatCurrency = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTab ?? () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 0.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(5.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          border: Border(
            top: BorderSide(width: 0.5, color: Color(0xFFE8E8E8)),
            bottom: BorderSide(width: 0.5, color: Color(0xFFE8E8E8)),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10.0,
                        color: widget.isOnline? Colors.green : Colors.grey,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        '${widget.userName}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      StartRating(rate: widget.starRating)
                    ],
                  ),
                  SizedBox(child: widget.isKYC? Row(
                    children: const [
                      Icon(
                        Icons.verified_user,
                        color: Colors.green,
                        size: 16.0,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Đã KYC',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ): null),
                ],
              ),
            ),
            // Container(
            //   color: Colors.black12,
            //   height: 1.0,
            //   width: MediaQuery.of(context).size.width,
            // ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                      '${formatCurrency.format(widget.cryptoPrice)} ${widget.basicMoney}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.left),
                                  Text('/${widget.cryptoName}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.left),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Tối đa: ${widget.cryptoAmount} ${widget.cryptoName}',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: widget.isBuy
                                  ? Colors.green
                                  : Colors.deepOrangeAccent,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Center(
                          child: Text(
                            widget.isBuy ? 'Mua' : 'Bán',
                            style: TextStyle(
                                color: widget.isBuy
                                    ? Colors.green
                                    : Colors.deepOrangeAccent,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Phương thức: ${widget.methodPayment}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
