import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class WalletDepositScreen extends StatelessWidget {
  WalletDepositScreen({Key? key}) : super(key: key);

  var paymentMethod = 'Bấm vào để lựa chọn'.obs;
  var onLoad = SizedBox(child: Text('Mua', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),)).obs;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      padding: EdgeInsets.all(15.0),
      appBar: AppBar(
        title: Text('Mua VNDT'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SỐ LƯỢNG',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
          SizedBox(height: 10.0),
          TextFieldInput(
            trailingBackground: Theme.of(context).backgroundColor,
            // trailingWidth: 60.0,
            trailing: Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'VNDT',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'CHỌN PHƯƠNG THỨC THANH TOÁN',
            style: TextStyle(
              fontSize: 13.0,
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
                onLoad.value = SizedBox(child: Text('Mua',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)));
                Get.to(_transferInfo());
              });
            },
            title: 'Mua',
            child: Obx(() => onLoad.value),
          ),
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
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 15.0,
                ),
                subTitle: 'Vietcombank - Ngân hàng TMCP ngoại thương viêt nam',
                borderBottom: true,
                arrow: false,
              ),
              Item(
                title: 'CHI NHÁNH',
                subTitle: 'CN TÂY ĐO',
                titleStyle: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 15.0,
                ),
                borderBottom: true,
                arrow: false,
              ),
              Item(
                title: 'TÀI KHOẢN',
                subTitle: '101589752',
                titleStyle: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 15.0,
                ),
                borderBottom: true,
                arrow: false,
                trailing: Text('Sao chép', style: TextStyle(color: Colors.blue[900], fontSize: 15.0)),
              ),
              Item(
                title: 'CHỦ TÀI KHOẢN',
                subTitle: 'CÔNG TY CỔ PHẦN TRUST CARD',
                titleStyle: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 15.0,
                ),
                borderBottom: true,
                arrow: false,
              ),
              Item(
                title: 'SỐ LƯỢNG',
                subTitle: '200,000 VNDT',
                titleStyle: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 15.0,
                ),
                borderBottom: true,
                arrow: false,
                trailing: Text('Sao chép', style: TextStyle(color: Colors.blue[900], fontSize: 15.0)),
              ),
              Item(
                title: 'NỘI DUNG GIAO DỊCH',
                subTitle: 'CK OID123459',
                titleStyle: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
                subTitleStyle: TextStyle(
                  fontSize: 15.0,
                ),
                arrow: false,
                trailing: Text('Sao chép', style: TextStyle(color: Colors.blue[900], fontSize: 15.0)),
              ),
              SizedBox(height: 10),
            ],
          ),
          GroupItem(
            children: const [
              SizedBox(height: 15),
              Item(
                height: 30.0,
                title: 'CHÚ Ý',
                arrow: false,
              ),
              Item(
                height: 40.0,
                title: 'Đúng số tiền(bao gồm phí chuyển khoản)',
                titleStyle: TextStyle(
                    fontSize: 15.0
                ),
                arrow: false,
              ),
              Item(
                height: 40.0,
                title: 'Đúng nội dung',
                titleStyle: TextStyle(
                  fontSize: 15.0
                ),
                arrow: false,
              ),
              Item(
                height: 40.0,
                title: 'Chuyển 24/7 nếu khác ngân hàng',
                titleStyle: TextStyle(
                    fontSize: 15.0
                ),
                arrow: false,
              ),
              SizedBox(height: 15),
            ],
          ),
          GroupItem(
            children: const [
              SizedBox(height: 18),
              Text(
                'Hủy giao dịch này',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 18),
            ],
          ),

        ],
      ),
    );
  }
}

