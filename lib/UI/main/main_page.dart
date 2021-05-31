import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/main/favourite/favourite.dart';
import 'package:oxygen/UI/main/home/home_page.dart';
import 'package:oxygen/UI/main/shopping_cart/shopping_Cart.dart';
import 'package:oxygen/UI/main/profile/profile/profile.dart';

class MainPage extends StatefulWidget {
  final int index;

  const MainPage({Key key, this.index}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey _btmNavKey = GlobalKey();
  final String language = translator.currentLanguage;
  int _selectedIndex = 0;

  var pages = [];

  whichPage() {
    if (widget.index == null) {
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      setState(() {
        _selectedIndex = widget.index;
      });
    }
  }

  @override
  void initState() {
    pages = [
      Home(),
      ShoppingCart(),
      Favourite(),
      Profile(),
    ];
    whichPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          key: _btmNavKey,
          index: _selectedIndex,
          height: 60,
          color: Color(0xfff0f0f5),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Theme.of(context).primaryColor,
          animationCurve: Curves.bounceInOut,
          animationDuration: Duration(milliseconds: 300),
          items: [
            _selectedIndex == 0
                ? Image.asset('assets/images/icons/homeac.png',
                    height: 35, width: 35, fit: BoxFit.cover)
                : Image.asset('assets/images/icons/home.png',
                    height: 25, width: 25, fit: BoxFit.cover),
            _selectedIndex == 1
                ? Image.asset('assets/images/icons/accart.png',
                    height: 35, width: 35, fit: BoxFit.cover)
                : Image.asset('assets/images/icons/mcart.png',
                    height: 25, width: 25, fit: BoxFit.cover),
            _selectedIndex == 2
                ? Image.asset('assets/images/icons/favourieac.png',
                    height: 35, width: 35, fit: BoxFit.cover)
                : Image.asset('assets/images/icons/favourite.png',
                    height: 25, width: 25, fit: BoxFit.cover),
            _selectedIndex == 3
                ? Image.asset('assets/images/icons/profileac.png',
                    height: 35, width: 35, fit: BoxFit.cover)
                : Image.asset('assets/images/icons/profile.png',
                    height: 27, width: 24, fit: BoxFit.fill),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

Widget activeIcon({Widget icon, BuildContext context}) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Theme.of(context).primaryColor,
    ),
    child: Center(
      child: icon,
    ),
  );
}
