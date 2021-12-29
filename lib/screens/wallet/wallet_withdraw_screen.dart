import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';

class WalletWithdrawScreen extends StatefulWidget {
  const WalletWithdrawScreen({Key? key}) : super(key: key);

  @override
  _WalletWithdrawScreenState createState() => _WalletWithdrawScreenState();
}

class _WalletWithdrawScreenState extends State<WalletWithdrawScreen> {

  var paymentMethod = 'Bấm vào để lựa chọn'.obs;
  var onLoad = SizedBox(child: Text('Rút', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),)).obs;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      appBar: AppBar(
        title: Text('Bán và rút về ngân hàng'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GroupItem(
            children: [
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Image.asset('assets/icons/crypto/usdt.png', width: 45.0,),
                  SizedBox(width: 15.0),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '100.150.000.000 VNDT',
                          style: TextStyle(
                              // color: Color(0xFF2A5CA8),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Prax VNDT',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
            ],
          ),
          SizedBox(height: 10.0),




          Text(
            'Số lượng'.toUpperCase(),
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),
          TextFieldInput(),

          SizedBox(height: 20.0),
          Text(
            'Chọn phương thức rút tiền'.toUpperCase(),
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.0),

          Obx(
                () => InkWell(
              onTap: () => Get.to(
                _choosePaymentMethod(),
                transition: Transition.rightToLeft,
              ),
              borderRadius: BorderRadius.circular(50.0),
              child: TextFieldInput(
                enabled: false,
                hintText: '${paymentMethod}',
                trailing: Icon(Icons.arrow_drop_down, size: 18.0),
              ),
            ),
          ),
          SizedBox(height: 40.0),
          ButtonPress(
            onPress: () {
              onLoad.value = SizedBox(
                  height: 24.0,
                  width: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5));
              Future.delayed(const Duration(seconds: 3), () {
                // deleayed code here
                onLoad.value = SizedBox(child: Text('Rút',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)));
                Get.to(_transferInfo());
              });
            },
            child: Obx(() => onLoad.value),
          ),

          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _choosePaymentMethod() {
    RxBool internetBanking = false.obs;
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Chọn phương thức thanh toán'),
      ),
      padding: EdgeInsets.all(15.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CHỌN PHƯƠNG THỨC THANH TOÁN',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
          SizedBox(height: 20.0),
          Item(
            onTap: () {
              internetBanking.value = internetBanking.isTrue ? false : true;
            },
            leading: Icon(Icons.credit_card, size: 35.0),
            height: 70.0,
            borderBottom: true,
            title: 'Internet banking',
            subTitle: 'Hỗ trợ internet banking',
            arrow: false,
            trailing: Obx(
                  () => Container(
                child: Icon(
                  internetBanking == true
                      ? Icons.expand_more
                      : Icons.chevron_right,
                  size: 22.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          Obx(
                () => Container(
              child: internetBanking == true
                  ? Column(
                children: [
                  InkWell(
                    onTap: () {
                      paymentMethod.value = 'Vietcombank- vcb';
                      Get.back();
                      // update();
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 30.0),
                        Flexible(
                          child: Item(
                            leading: Icon(Icons.credit_card, size: 30.0),
                            title: 'Techcombank - Ngân hàng TMCP ngoại thương',
                            arrow: false,
                            borderBottom: true,
                          ),
                        ),
                        Icon(Icons.check_circle, size: 18.0, color: Colors.green),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      paymentMethod.value = 'Vietcombank- vcb';
                      Get.back();
                      // update();
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 30.0),
                        Flexible(
                          child: Item(
                            leading: Icon(Icons.credit_card, size: 30.0),
                            title: 'Techcombank - Ngân hàng TMCP ngoại thương',
                            arrow: false,
                            borderBottom: true,
                          ),
                        ),
                        Icon(Icons.check_circle, size: 18.0, color: Colors.green),
                      ],
                    ),
                  ),
                ],
              )
                  : SizedBox(),
            ),
          ),
          Item(
            leading: Icon(Icons.account_balance_wallet, size: 35.0),
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            title: 'Ví điện tử',
            subTitle: 'Hỗ trợ internet banking',
          ),
        ],
      ),
    );
  }

  Widget _transferInfo(){
    return EmptyScreen(
      appBar: AppBar(
        title: Text('Thông tin chuyển khoản'),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      body: ListView(
        children: [

          GroupItem(
            children: [
              SizedBox(height: 10),
              Item(
                title: 'PHƯƠNG THỨC THANH TOÁN',
                titleStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 16.0,
                ),
                subTitle: 'Vietcombank - Ngân hàng TMCP ngoại thương viêt nam',
                borderBottom: true,
                arrow: false,
              ),
              Item(
                title: 'CHI NHÁNH',
                subTitle: 'CN TÂY ĐO',
                titleStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 16.0,
                ),
                borderBottom: true,
                arrow: false,
              ),
              Item(
                title: 'TÀI KHOẢN',
                subTitle: '101589752',
                titleStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 16.0,
                ),
                borderBottom: true,
                arrow: false,
                trailing: Text('Sao chép', style: TextStyle(color: Colors.blue[900], fontSize: 15.0)),
              ),
              Item(
                title: 'CHỦ TÀI KHOẢN',
                subTitle: 'CÔNG TY CỔ PHẦN TRUST CARD',
                titleStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 16.0,
                ),
                borderBottom: true,
                arrow: false,
              ),
              Item(
                title: 'SỐ LƯỢNG',
                subTitle: '200,000 VNDT',
                titleStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 16.0,
                ),
                borderBottom: true,
                arrow: false,
                trailing: Text('Sao chép', style: TextStyle(color: Colors.blue[900], fontSize: 15.0)),
              ),
              Item(
                title: 'NỘI DUNG GIAO DỊCH',
                subTitle: 'CK OID123459',
                titleStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 16.0,
                ),
                arrow: false,
                trailing: Text('Sao chép', style: TextStyle(color: Colors.blue[900], fontSize: 15.0)),
              ),
              SizedBox(height: 10),
            ],
          ),

        ],
      ),
    );
  }

}
