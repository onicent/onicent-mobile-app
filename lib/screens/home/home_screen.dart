import 'package:get/get.dart';
import 'package:onicent/widgets/button_press.dart';
import 'package:onicent/widgets/empty_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'news_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Novic'),
        automaticallyImplyLeading: false,
      ),
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
                    ButtonPress(
                      title: 'Xem tất cả',
                      onPress: (){
                        Get.to(NewsScreen(), transition: Transition.rightToLeftWithFade);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
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
                border: Border.all(width: 1.0, color:  Get.theme.backgroundColor),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: Get.theme.backgroundColor,
            ),
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
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1.0, color: Get.theme.dividerColor )),
      ),
      child: InkWell(
        onTap: () => onTab,
        borderRadius:  BorderRadius.circular(6.0),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          height: 85.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(
                  '$icon',
                  height: 60,
                  width: 120,
                ),
              ),
              Container(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Container(
                      height: 8.0,
                    ),
                    Text(
                      '$date',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.grey,),
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
