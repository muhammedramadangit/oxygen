import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/UI/main/profile/profile/components/profile_item.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> scaffold_Key = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  bool subscribValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_Key,
      drawer: DrawerView(),
      body: Stack(
        children: [
          //============= profile Image position ====================
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2 + 50,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.5),
          ),

          //============= custom AppBar =================
          Align(
            alignment: Alignment.topCenter,
            child: customAppBar(
              context: context,
              appBarTilteKey: 'my_account',
              bgColor: Colors.transparent,
              showDrawerIcon: true,
              onPressedDrawer: () => scaffold_Key.currentState.openDrawer(),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2 + 60,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Color(lightThemeColors['primary']),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Text(
                'محمد رمضان',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'JannaLT-Bold',
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  profileItem(
                    title_Key: 'edit_my_account',
                    leading: customImageContainer(imgSrc: 'assets/images/icons/editeinfo.png'),
                    onTap: () {
                      navigator.push(Routes.EDIT_MY_ACCOUNT);
                    },
                  ),
                  profileCustomDivider(),
                  profileItem(
                    title_Key: 'change_password',
                    leading: customImageContainer(imgSrc: 'assets/images/icons/editepass.png'),
                    onTap: () {
                      navigator.push(Routes.CHANGE_PASSWORD);
                    },
                  ),
                  profileCustomDivider(),
                  profileItem(
                    title_Key: 'my_orders',
                    leading: customImageContainer(imgSrc: 'assets/images/icons/requests.png'),
                    onTap: () {
                      navigator.push(Routes.MY_ORDERS);
                    },
                  ),
                  profileCustomDivider(),
                  profileItem(
                    title_Key: 'Shipping_addresses',
                    leading: customImageContainer(imgSrc: 'assets/images/icons/shipping.png'),
                    onTap: () {
                      navigator.push(Routes.SHIPPING_ADDRESSES);
                    },
                  ),
                  profileCustomDivider(),
                  profileItem(
                    title_Key: 'Subscribe_to_the_newsletter',
                    leading: customImageContainer(imgSrc: 'assets/images/icons/nletter.png'),
                    trailing: CupertinoSwitch(
                      activeColor: Color(lightThemeColors['primary']),
                      value: subscribValue,
                      onChanged: (value) {
                        setState(() {
                          subscribValue = value;
                        });
                      },
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
