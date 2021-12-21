import 'dart:math';
import 'package:flutter/material.dart';

double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

class StartRating extends StatefulWidget {
  final double rate;
  const StartRating({Key? key, this.rate = 0}) : super(key: key);

  @override
  State<StartRating> createState() => _StartRatingState();
}

class _StartRatingState extends State<StartRating> {
  Widget borderStar = const Icon(
    Icons.star_border,
    color: Colors.orange,
    size: 16.0,
  );
  Widget halfStar = const Icon(
    Icons.star_half,
    color: Colors.orange,
    size: 16.0,
  );
  Widget start = const Icon(
    Icons.star,
    color: Colors.orange,
    size: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    Widget zeroRate = Row(children: [borderStar, borderStar, borderStar, borderStar, borderStar]);
    Widget halfRate = Row(children: [halfStar, borderStar, borderStar, borderStar, borderStar]);
    Widget oneRate = Row(children: [start, borderStar, borderStar, borderStar, borderStar]);
    Widget oneHalfRate = Row(children: [start, halfStar, borderStar, borderStar, borderStar]);
    Widget twoRate = Row(children: [start, start, borderStar, borderStar, borderStar]);
    Widget twoHalfRate = Row(children: [start, start, halfStar, borderStar, borderStar]);
    Widget threeRate = Row(children: [start, start, start, borderStar, borderStar]);
    Widget threeHalfRate = Row(children: [start, start, start, halfStar, borderStar]);
    Widget fourRate = Row(children: [start, start, start, start, borderStar]);
    Widget fourHalfRate = Row(children: [start, start, start, start, halfStar]);
    Widget fiveRate = Row(children: [start, start, start, start, start]);

    if (widget.rate == 0) {
      return zeroRate;
    } else if (widget.rate == 0.5) {
      return halfRate;
    } else if (widget.rate == 1.0) {
      return oneRate;
    } else if (widget.rate == 1.5) {
      return oneHalfRate;
    } else if (widget.rate == 2.0) {
      return twoRate;
    } else if (widget.rate == 2.5) {
      return twoHalfRate;
    } else if (widget.rate == 3.0) {
      return threeRate;
    } else if (widget.rate == 3.5) {
      return threeHalfRate;
    } else if (widget.rate == 4.0) {
      return fourRate;
    } else if (widget.rate == 4.5) {
      return fourHalfRate;
    } else if (widget.rate == 5.0) {
      return fiveRate;
    } else {
      return zeroRate;
    }
  }
}
