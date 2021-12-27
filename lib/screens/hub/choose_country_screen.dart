import 'package:flutter/material.dart';
import '../../widgets/empty_screen.dart';
import '../../widgets/widgets.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  _ChooseCountryScreenState createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      // title: 'Quốc gia',
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      body: ListView(
        children: [
          GroupItem(
            children: [
              InkWell(
                onTap: () {
                },
                child: Item(
                  borderBottom: true,
                  borderTop: true,
                  title: "Việt nam",
                  arrow: false,
                ),
              ),
              Item(
                borderBottom: true,
                title: "Thailan",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),
              Item(
                borderBottom: true,
                title: "Campuchia",
                arrow: false,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
