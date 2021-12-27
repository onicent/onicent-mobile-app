import 'package:onicent/models/market/list_crypto_model.dart';
import 'package:onicent/services/network.dart';


import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/wallet/wallet_screen.dart';
import '../screens/market/market_screen.dart';
import '../screens/hub/hub.dart';
import '../screens/p2p/p2p_screen.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainer createState() => _MainContainer();
}

class _MainContainer extends State<MainContainer> {
  int _currentIndex = 0;
  // int _selectedIndex = 0;

  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<ListCryptoModel>? dataCrypto;
  // List<ListCryptoModel> ListCrypto = List<ListCryptoModel>();


  // @override
  // void initState() {
  //   super.initState();
  //   fetchListCrypto().then((value) => {});
  //   futureCrypto = fetchListCrypto();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchListCrypto().then(
          (value) => {
        setState(() {
          dataCrypto = value;
        }),
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      const HomeScreen(),
      MarketScreen(dataListCrypto: dataCrypto),
      const P2PScreen(),
      const WalletScreen(),
      const HubScreen(),
    ];

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: Color(0xFFF5F8FD),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,

          // selectedLabelStyle: textTheme.caption,
          // unselectedLabelStyle: textTheme.caption,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          iconSize: 26,

          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: [
            const BottomNavigationBarItem(
              label: 'Trang chủ',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(
                Icons.home,
              ),
            ),
            const BottomNavigationBarItem(
              label: 'Giao dịch',
              icon: Icon(Icons.analytics_outlined),
              activeIcon: Icon(
                Icons.analytics,
              ),
            ),
            const BottomNavigationBarItem(
              label: 'P2P',
              icon: Icon(Icons.sync_alt_outlined),
              activeIcon: Icon(
                Icons.sync_alt,
              ),
            ),
            const BottomNavigationBarItem(
              label: 'Ví của tôi',
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(
                Icons.account_balance_wallet,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cá nhân',
              icon: _badge(),
              activeIcon: const Icon(
                Icons.person_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge({
    int count = 9,
  }) {
    return Stack(
      children: <Widget>[
        const Icon(Icons.person_outlined),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: count == 0 ? Colors.transparent : Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              count == 0 ? '' : '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
