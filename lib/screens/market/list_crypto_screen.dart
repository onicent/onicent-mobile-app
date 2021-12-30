import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';
import 'crypto_detail_screen.dart';

import 'package:intl/intl.dart';
import '../../models/market/list_crypto_model.dart';
import '../../services/network.dart';

class ListCryptoScreen extends StatefulWidget {
  List<ListCryptoModel> dataListCrypto;
  bool isShowSearch;
  ListCryptoScreen({
    Key? key,
    required this.dataListCrypto,
    this.isShowSearch = false,
  }) : super(key: key);

  @override
  _ListCryptoScreenState createState() => _ListCryptoScreenState();
}

class _ListCryptoScreenState extends State<ListCryptoScreen> {
  // This line format formatCurrency
  // final formatCurrency = NumberFormat("#,##0", "vi_VND"); //vi_VND
  final formatCurrency = NumberFormat("#,##0.00", "en_US"); //vi_VND

  // This variable is used to store data to search.
  List<ListCryptoModel>? _listCrypto;

  // This variable show data.
  static List<ListCryptoModel>? _listCryptoDisplay;

  // used to identify events at the bottom of the page.
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listCrypto = widget.dataListCrypto;
    _listCryptoDisplay = _listCrypto;

    // launch an event if there is an impact on the bottom of the page.
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreList();
      }
    });
  }

  // Page reload function.
  Future<Null> _refreshDataCrypto() async {
    fetchListCrypto().then(
      (value) => {
        setState(() {
          // Remove all elements in array.
          _listCryptoDisplay!.clear();

          // Add newly loaded element to list.
          _listCryptoDisplay!.addAll(value);
        }),
      },
    );

    // 1s wait animation.
    await Future.delayed(const Duration(seconds: 1));
  }

  // Function to load more data when the footer is fully extended.
  // Currently not in use.
  Future<Null> _getMoreList() async {
    print('get more list...');
  }

  @override
  Widget build(BuildContext context) {
    // If the search button is closed, the data will be returned to the original.
    if (widget.isShowSearch == false) {
      _listCryptoDisplay = _listCrypto;
    }
    return Column(
      children: [
        if (widget.isShowSearch) ...[
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Get.theme.backgroundColor,
              border: Border(
                  // bottom: BorderSide(width: 0.6, color: Color(0xFFE8E8E8)),
              ),
            ),
            child: Container(
              // height: 40.0,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: Get.theme.dividerColor),
                borderRadius: BorderRadius.circular(5.0),
                color: Get.theme.inputDecorationTheme.fillColor,
              ),
              child: Center(
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 22.0, color: Colors.grey),
                    const SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tìm kiếm',
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                        onChanged: (text) {
                          text.toLowerCase();

                          // Search by initials.
                          setState(() {
                            var cryptoShortNames =
                                _listCrypto!.where((element) {
                              return element.cryptoShortName!
                                  .toLowerCase()
                                  .contains(text);
                            }).toList();

                            // Search by primary name.
                            var cryptoNames = _listCrypto!.where((element) {
                              return element.cryptoName!
                                  .toLowerCase()
                                  .contains(text);
                            }).toList();

                            // if searching data by initials does not exist,
                            // then search switches to, search by primary name.
                            if (cryptoShortNames.isEmpty) {
                              _listCryptoDisplay = cryptoNames;
                            } else {
                              _listCryptoDisplay = cryptoShortNames;
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],


        Flexible(
          child: RefreshIndicator(
            onRefresh: _refreshDataCrypto,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: (() {
                if (_listCryptoDisplay != null) {
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _listCryptoDisplay!.length,
                    // itemExtent: 80.0,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      // footer loading effect.
                      // if (index == _listCryptoDisplay!.length) {
                      //   return const Center(child: CircularProgressIndicator());
                      // }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_listCryptoDisplay![index].status == 1) ...[
                            CryptoItem(
                              cryptoIcon:
                                  '${_listCryptoDisplay![index].cryptoIcon}',
                              cryptoShortName:
                                  '${_listCryptoDisplay![index].cryptoShortName}',
                              cryptoName:
                                  '${_listCryptoDisplay![index].cryptoName}',
                              isUp: _listCryptoDisplay![index].isUp ?? false,
                              trailing: const Text(
                                'Đang bảo trì...',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ] else ...[
                            GroupItem(
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(top: 10.0),
                              children: [
                                Item(
                                  arrow: false,
                                  leading: Row(
                                    children: [
                                      Image.asset(
                                          'assets/icons/crypto/${_listCryptoDisplay![index].cryptoIcon}',
                                          width: 42.0),
                                      SizedBox(width: 10.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${_listCryptoDisplay![index].cryptoShortName}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            '${_listCryptoDisplay![index].cryptoName}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${formatCurrency.format(_listCryptoDisplay![index].cryptoPriceNow)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            '${_listCryptoDisplay![index].upOrDownPercent}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0,
                                                color:
                                                    _listCryptoDisplay![index]
                                                                .isUp ==
                                                            true
                                                        ? Colors.green
                                                        : Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(createRoute(
                                        const CryptoDetailScreen(
                                            cryptoId: '')));
                                  },
                                ),
                              ],
                            ),
                          ],

                          if (_listCryptoDisplay!.length == index + 1) ...[
                            const SizedBox(height: 10.0),
                          ],
                          // Text("${snapshot.data![index].body}"),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }()),
            ),
          ),
        ),
      ],
    );
  }
}
