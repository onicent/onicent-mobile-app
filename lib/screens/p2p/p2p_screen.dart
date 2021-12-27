import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'my_ads_screen.dart';
import 'p2p_buy_screen.dart';
import 'p2p_sell_screen.dart';

class P2PScreen extends StatefulWidget {
  const P2PScreen({Key? key}) : super(key: key);

  @override
  State<P2PScreen> createState() => _P2PScreenState();
}

class _P2PScreenState extends State<P2PScreen> {
  String CryptoNameSelect = 'ETHERIUM';
  String CryptoIconSelect = 'eth.png';
  
  int renderScreen = 0;
  Color backgroundBtnLeft = Colors.green;
  Color textBtnColorLeft = Color(0xFFFFFFFF);
  Color backgroundBtnRight = Color(0xFFC6C7C9);
  Color textBtnColorRight = Colors.black87;

  final TabScope? _tabScope = TabScope.getInstance();

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(actions: [Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 25),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/crypto/${CryptoIconSelect}',
                    height: 20,
                  ),
                  SizedBox(width: 12.0),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => _selectCrypto()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          CryptoNameSelect,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(width: 4.0),
                        Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       renderScreen = 0;
                //       // backgroundBtnLeft = Color(0xFF3983F1);
                //       backgroundBtnLeft = Colors.green;
                //       textBtnColorLeft = Color(0xFFFFFFFF);
                //       backgroundBtnRight = Color(0xFFC6C7C9);
                //       textBtnColorRight = Colors.black87;
                //     });
                //   },
                //   child: Container(
                //     width: 60.0,
                //     height: 28.0,
                //     decoration: BoxDecoration(
                //       color: backgroundBtnLeft,
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(5.0),
                //         bottomLeft: Radius.circular(5.0),
                //       ),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Mua',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: textBtnColorLeft,
                //             fontWeight: FontWeight.w400,
                //             fontSize: 15),
                //       ),
                //     ),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       renderScreen = 1;
                //       backgroundBtnLeft = Color(0xFFC6C7C9);
                //       textBtnColorLeft = Colors.black87;
                //       backgroundBtnRight = Colors.redAccent;
                //       textBtnColorRight = Color(0xFFFFFFFF);
                //     });
                //   },
                //   child: Container(
                //     width: 60.0,
                //     height: 28.0,
                //     decoration: BoxDecoration(
                //       color: backgroundBtnRight,
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(5.0),
                //         bottomRight: Radius.circular(5.0),
                //       ),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Bán',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             color: textBtnColorRight,
                //             fontWeight: FontWeight.w400,
                //             fontSize: 15),
                //       ),
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: (){
                    Navigator.of(context)
                        .push(createRoute(const MyADSScreen()));
                  },
                  child: Container(
                    height: double.infinity,
                    child: Center(
                      child: Icon(
                        Icons.dashboard_customize,
                        color: Colors.white,
                        size: 32.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),],),
      body: DefaultTabController(
        length: 2,
        initialIndex: _tabScope!.tabIndex,
        child: Column(
          children: <Widget>[
            Container(
              height: 35.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                onTap: (index) => _tabScope!.setTabIndex(index),
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                indicator: UnderlineTabIndicator(
                  // borderSide: BorderSide.none,
                  // insets: EdgeInsets.zero,
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                ),
                // indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ), //For Selected tab
                labelColor: Colors.black87,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ), //For Selected tab
                // indicatorSize: TabBarIndicatorSize.label,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: const Text('Mua'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: const Text('Bán'),
                    ),
                  ),
                ],
              ),
            ),
             const Expanded(
              child: TabBarView(
                children: [
                  P2PBuyScreen(),
                  P2PSellScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
      // RefreshIndicator(
      //   onRefresh: () {
      //     return Future.delayed(
      //       const Duration(seconds: 1),
      //           () {
      //         print('hello');
      //       },
      //     );
      //   },
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 0.0),
      //     child: (() {
      //       if (renderScreen == 0) {
      //         return P2PBuyScreen();
      //       } else {
      //         return P2PSellScreen();
      //       }
      //     }()),
      //   ),
      // ),
    );
  }

  Widget _selectCrypto(){
    return EmptyScreen(
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
              setState(() {
                CryptoNameSelect = 'Bitcoin';
                CryptoIconSelect = 'btc.png';
              });
            },
            child: Ink(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Row(
                  children: [
                    Image.asset('assets/icons/crypto/btc.png', width: 38.0),
                    SizedBox(width: 20.0),
                    Text(
                      'Bitcoin',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
              setState(() {
                CryptoNameSelect = 'ETHERIUM';
                CryptoIconSelect = 'eth.png';
              });
            },
            child: Ink(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Row(
                  children: [
                    Image.asset('assets/icons/crypto/eth.png', width: 38.0),
                    SizedBox(width: 20.0),
                    Text(
                      'Etherium',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
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
