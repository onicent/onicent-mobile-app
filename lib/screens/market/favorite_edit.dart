import '../../models/market/list_crypto_model.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'crypto_detail_screen.dart';

class FavoriteEditScreen extends StatefulWidget {
  Future<List<ListCryptoModel>> dataListCrypto;

  FavoriteEditScreen({
    Key? key,
    required this.dataListCrypto,
  }) : super(key: key);

  @override
  _FavoriteEditScreenState createState() => _FavoriteEditScreenState();
}

class _FavoriteEditScreenState extends State<FavoriteEditScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Chọn mục ưa thích',
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 0.6, color: Color(0xFFE8E8E8))),
            ),
            child: Container(
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: Color(0xFFECEFF3)),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.search, size: 22.0, color: Colors.grey),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.black87),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tìm kiếm',
                          hintStyle:
                          TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FutureBuilder<List<ListCryptoModel>>(
              future: widget.dataListCrypto,
              builder: (context, snapshot) {
                print(snapshot.hasData);

                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CryptoItem(
                          cryptoIcon: 'Ripple-icon.png',
                          cryptoShortName: 'BTC',
                          cryptoName: 'Bitcoin',
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                                createRoute(const CryptoDetailScreen(cryptoId: '')));
                          },
                          trailing: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Image.asset(
                                  'assets/icons/${true ? 'ic_favourite_checked.png' : 'ic_favourite_unchecked.png'}',
                                  width: 20.0),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        // Text("${snapshot.data![index].body}"),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

