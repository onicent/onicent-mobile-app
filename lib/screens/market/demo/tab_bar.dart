import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';
import '../crypto_chart_screen.dart';

class CryptoDetailScreen extends StatefulWidget {
  const CryptoDetailScreen({Key? key}) : super(key: key);

  @override
  _CryptoDetailScreenState createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  final _TabScope? _tabScope = _TabScope.getInstance();

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'BITCOIN',
      body: Container(
        child: DefaultTabController(
          length: 3,
          initialIndex: _tabScope!.tabIndex,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                // the tab bar with two items
                SizedBox(
                  height: 50,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    bottom: TabBar(
                      onTap: (index) => _tabScope!.setTabIndex(index),
                      indicatorColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.black54,
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                      //For Selected tab
                      labelColor: Colors.blueAccent,
                      labelStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                      //For Selected tab
                      tabs: const [
                        Tab(
                            child: Text(
                              'Thị trường',
                            )),
                        Tab(
                            child: Text(
                              'Dữ liệu',
                            )),
                        Tab(
                            child: Text(
                              'Thông tin',
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      CryptoChartScreen(),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_bike),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabScope {
  // singleton class
  static _TabScope? _tabScope;
  int tabIndex = 0;

  static _TabScope? getInstance() {
    if (_tabScope == null) _tabScope = _TabScope();

    return _tabScope;
  }

  void setTabIndex(int index) {
    tabIndex = index;
  }
}
