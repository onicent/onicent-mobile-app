import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

class CryptoItem extends StatefulWidget {
  final bool isUp;
  final double height;
  final String cryptoIcon;
  final String cryptoName;
  final String cryptoShortName;
  final List<double>? dataChart;
  final String? cryptoPriceNow;
  final double? upOrDownPercent;
  final Function()? onTap;
  final Widget? trailing;
  final Color? backgroundColor;


  const CryptoItem({
    Key? key,
    this.isUp = true,
    this.height = 80.0,
    this.cryptoIcon = '',
    this.cryptoName = '',
    this.cryptoShortName = '',
    this.dataChart,
    this.cryptoPriceNow,
    this.upOrDownPercent,
    this.onTap,
    this.trailing,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<CryptoItem> createState() => _CryptoItemState();
}

class _CryptoItemState extends State<CryptoItem> {
  @override
  Widget build(BuildContext context) {
    return WrapCard(
      onTab: widget.onTap,
      height: widget.height,
      backgroundColor: widget.backgroundColor,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/crypto/${widget.cryptoIcon}',
            width: 40.0,
          ),
          const SizedBox(width: 15),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cryptoShortName,
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 6.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cryptoName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.dataChart != null) ...[
            const SizedBox(width: 10),
            Flexible(
              flex: 3,
              child: SizedBox(
                height: 39,
                // color: Colors.black12,
                child: Sparkline(
                  data: widget.dataChart ?? <double>[],
                  lineColor:
                      widget.isUp ? const Color(0xFF10A80A) : const Color(0xFFFD3445),
                  lineWidth: 1.9,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: widget.isUp
                        ? [const Color(0xFFBEFFB3), const Color(0x00ffffff)]
                        : [const Color(0xFFFDC5C5), const Color(0x00ffffff)],
                  ),
                  useCubicSmoothing: true,
                  cubicSmoothingFactor: 0.1,
                ),
              ),
            ),
          ],
          if (widget.cryptoPriceNow != null || widget.upOrDownPercent != null) ...[
            const SizedBox(width: 10),
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${widget.cryptoPriceNow}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${widget.isUp ? '+' : '-'}${widget.upOrDownPercent}%',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: widget.isUp ? Colors.green : Colors.red,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (widget.trailing != null) ...[
            Flexible(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: widget.trailing,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
