import 'package:bitnet/widgets/empty_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      iconBack: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                // child: Image.network(
                //   'https://mcg.com.vn/en/wp-content/uploads/2016/06/BSC-400x200.png',
                //   height: 140,
                //   width: MediaQuery.of(context).size.width,
                //   fit: BoxFit.fill,
                // ),
              ),
              Row(
                children: [
                  Text(
                    'Ứng dụng',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        _itemApp(
                          ontab: (){

                          },
                          icon: 'assets/icons/ic_vector_ic_add_money.png',
                          title: 'Mua thẻ cào',
                        ),
                        _itemApp(
                          icon: 'assets/icons/ic_vector_ic_add_money.png',
                          title: 'Mua bán Crypto',
                        ),
                        _itemApp(
                          icon: 'assets/icons/ic_vector_ic_add_money.png',
                          title: 'Gửi tiết kiệm',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _itemApp(
                          icon: 'assets/icons/ic_vector_ic_add_money.png',
                          title: 'Mua thẻ cào',
                        ),
                        _itemApp(
                          icon: 'assets/icons/ic_vector_ic_add_money.png',
                          title: 'Mua bán Crypto',
                        ),
                        _itemApp(
                          icon: 'assets/icons/ic_vector_ic_add_money.png',
                          title: 'Gửi tiết kiệm',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Tin tức',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                  children: [
                    _newsItem(
                      icon:
                      'https://mcg.com.vn/en/wp-content/uploads/2016/06/BSC-400x200.png',
                      title:
                      'Cơ hội sở hữu đồng EXT ngay hôm nay cho thị trường đi xuống',
                      date: '22/11/2021',
                    ),
                    _newsItem(
                      icon:
                      'https://mcg.com.vn/en/wp-content/uploads/2016/06/BSC-400x200.png',
                      title: 'Niêm iết bnb trên sàn giao dịch hôm nay',
                      date: '22/11/2021',
                    ),
                    _newsItem(
                      icon:
                      'https://mcg.com.vn/en/wp-content/uploads/2016/06/MPI-1-400x200.png',
                      title: 'Niêm iết bnb trên sàn giao dịch hôm nay',
                      date: '22/11/2021',
                    ),
                    _newsItem(
                      icon:
                      'https://mcg.com.vn/en/wp-content/uploads/2016/06/Care-400x200.png',
                      title: 'Niêm iết bnb trên sàn giao dịch hôm nay',
                      date: '22/11/2021',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {},
                        child: Ink(
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFBED5FA),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                            border:
                            Border.all(width: 1.0, color: Colors.black26),
                            boxShadow: [],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Xem tất cả',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemApp({
    String? icon,
    String? title,
    Function()? ontab,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () => ontab!,
          child: Ink(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: const Color(0xFFFAF9F9)),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white),
            child: Container(
              height: 85,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    '$icon',
                    width: 45,
                    height: 45,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '$title',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _newsItem({
    String? icon,
    String? title,
    String? date,
    Function()? onTab,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1.0, color: Color(0xFFF1F1F1))),
      ),
      child: InkWell(
        onTap: () => onTab,
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          color: Colors.white.withOpacity(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                '$icon',
                height: 60,
                width: 120,
              ),
              Container(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      height: 8.0,
                    ),
                    Text(
                      '$date',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
