import 'my_ads_add_item.dart';
import 'package:onicent/screens/p2p/my_ads_buy_screen.dart';
import 'package:onicent/screens/p2p/my_ads_sell_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class MyADSScreen extends StatefulWidget {
  const MyADSScreen({Key? key}) : super(key: key);

  @override
  State<MyADSScreen> createState() => _MyADSScreenState();
}

class _MyADSScreenState extends State<MyADSScreen> {
  @override
  Widget build(BuildContext context) {
    final TabScope? _tabScope = TabScope.getInstance();
    print(_tabScope);
    return EmptyScreen(
      title: 'Bảng điều khiển',
      tabBarAction: [
        IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(createRoute(const MyADSAddItem()));
          },
          icon: Icon(Icons.add),
        )
      ],
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
                onTap: (index) => _tabScope.setTabIndex(index),
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
                      child: const Text('Quảng cáo mua'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: const Text('Quảng cáo bán'),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MyADSBuyScreen(),
                  MyADSSellScreen(),
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
