import 'package:onicent/models/market/list_crypto_model.dart';
import 'package:onicent/screens/market/favorite_edit.dart';
import 'package:onicent/services/network.dart';

import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

import 'favorite_crypto_screen.dart';
import 'list_crypto_screen.dart';

class MarketScreen extends StatefulWidget {
  List<ListCryptoModel>? dataListCrypto;

  MarketScreen({
    Key? key,
    this.dataListCrypto,
  }) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final TabScope? _tabScope = TabScope.getInstance();
  // late Future<List<ListCryptoModel>> futureCryptos;
  // List<ListCryptoModel> ListCrypto = List<ListCryptoModel>();

  bool isShowSearch = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: _tabScope!.tabIndex,
      child: EmptyScreen(
        appBar: Container(
          padding: const EdgeInsets.only(left: 15.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TabBar(
                  onTap: (index) => _tabScope!.setTabIndex(index),
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide.none,
                    insets: EdgeInsets.zero,
                  ),
                  unselectedLabelColor: Colors.black54,
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ), //For Selected tab
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ), //For Selected tab
                  // indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: const Text('Yêu thích'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: const Text('Danh mục'),
                      ),
                    ),
                    // Tab(
                    //   child: Container(
                    //     margin: const EdgeInsets.only(left: 8.0),
                    //     child: const Text('Bộ sưu tập'),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    if (_tabScope!.tabIndex == 0) ...[
                      IconButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .push(createRoute(FavoriteEditScreen(dataListCrypto: widget.dataListCrypto)));
                        },
                        icon: Image.asset(
                          'assets/icons/icon_top_edit.png',
                          width: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    IconButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .push(createRoute(SearchScreen(dataListCrypto: widget.dataListCrypto)));

                        setState(() {
                          isShowSearch = !isShowSearch;
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                children: [
                  // FavoriteCryptoScreen(dataListCrypto: _dataListCrypto!),
                  Container(
                    child: widget.dataListCrypto != null
                        ? FavoriteCryptoScreen(
                            dataListCrypto: widget.dataListCrypto!,
                            isShowSearch: isShowSearch,
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),

                  Container(
                    child: widget.dataListCrypto != null
                        ? ListCryptoScreen(
                            dataListCrypto: widget.dataListCrypto!,
                            isShowSearch: isShowSearch,
                          )
                        : Center(child: CircularProgressIndicator()),
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

class TabScope {
  // singleton class
  static TabScope? _tabScope;
  int tabIndex = 0;

  static TabScope? getInstance() {
    _tabScope ??= TabScope();

    return _tabScope;
  }

  void setTabIndex(int index) {
    tabIndex = index;
  }
}
