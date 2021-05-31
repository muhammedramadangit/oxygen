import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/theme/color.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: ListView(
            padding: EdgeInsets.only(right: 15, left: 15, top: 50, bottom: 15),
            children: [
              //============ drawer picture ============
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0,
                widget: Container(
                  height: 80,
                  width: 80,
                  alignment:
                      language == 'ar' ? Alignment.topRight : Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //================= user name ====================
              SizedBox(height: 15),
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0,
                widget: Text(
                  translator.translate('welcome'),
                  style: TextStyle(
                    color: Color(lightThemeColors['border']),
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 5),
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 50.0,
                virticaloffset: 0,
                widget: Text(
                  'محمد رمضان',
                  style: TextStyle(
                    color: Color(lightThemeColors['border']),
                    fontSize: 16,
                    fontFamily: 'JannaLT-Bold',
                  ),
                ),
              ),
              SizedBox(height: 5),
              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0.0,
                virticaloffset: 50,
                widget: Divider(
                  color: Color(lightThemeColors['primary']),
                ),
              ),

              //============= drawer content =================
              drawerItem(
                title_Key: 'main_page',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/shome.png'),
                onTap: () {
                  navigator.push(Routes.MAIN_PAGE);
                },
              ),

              drawerItem(
                title_Key: 'my_cart',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/scart.png'),
                onTap: () {
                  navigator.push(Routes.MAIN_PAGE, arguments: 1);
                },
              ),

              drawerItem(
                title_Key: 'sections',
                icon:
                    customImageContainer(imgSrc: 'assets/images/icons/sct.png'),
                onTap: () {
                  navigator.push(Routes.SECTIONS);
                },
              ),

              drawerItem(
                title_Key: 'special_offers',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/soffers.png'),
                onTap: () {
                  navigator.push(Routes.OFFERS);
                },
              ),

              drawerItem(
                title_Key: 'contact_us',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/scall.png'),
                onTap: () {
                  navigator.push(Routes.CONTACT_US);
                },
              ),

              drawerItem(
                title_Key: 'terms_and_conditions',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/scond.png'),
                onTap: () {
                  navigator.push(Routes.TERMS_AND_CONDITIONS);
                },
              ),

              drawerItem(
                title_Key: 'currency',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/scurr.png'),
                onTap: () {
                  navigator.push(Routes.CURRENCY);
                },
              ),

              drawerItem(
                title_Key: 'language',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/slang.png'),
                onTap: () {
                  navigator.push(Routes.CHOOSE_LANGUAGE);
                },
              ),

              AnimatedWidgets(
                duration: 1.5,
                horizontalOffset: 0.0,
                virticaloffset: 50,
                widget: Divider(
                  color: Color(lightThemeColors['primary']),
                ),
              ),

              drawerItem(
                title_Key: 'log_out',
                icon: customImageContainer(
                    imgSrc: 'assets/images/icons/sout.png'),
                onTap: () {
                  navigator.push(Routes.LOG_IN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerItem({
  Function onTap,
  String title_Key,
  Widget icon,
}) {
  return AnimatedWidgets(
    duration: 1.5,
    horizontalOffset: 0.0,
    virticaloffset: 50,
    widget: ListTile(
      onTap: onTap,
      title: Text(
        translator.translate(title_Key),
        style: TextStyle(
          color: Color(lightThemeColors['border']),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: icon,
    ),
  );
}
