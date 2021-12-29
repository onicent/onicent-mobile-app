import 'package:get/get.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Get.theme.backgroundColor,
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBar(
                    onTap: (index) => _tabScope!.setTabIndex(index),
                    labelPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide.none,
                      insets: EdgeInsets.zero,
                    ),
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ), //For Selected tab
                    labelColor: Colors.blue[900],
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        onPressed: (){

                          setState(() {
                            isShowSearch = !isShowSearch;
                          });
                        },
                        icon: Icon(
                          Icons.search,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
