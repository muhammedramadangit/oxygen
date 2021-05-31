import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/UI/main/drawer/drawer.dart';
import 'package:oxygen/theme/color.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  GlobalKey<FormState> form_Key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffold_Key = GlobalKey<ScaffoldState>();
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
          key: scaffold_Key,
          appBar: customAppBar(
            context: context,
            appBarTilteKey: 'contact_us',
            showDrawerIcon: true,
            onPressedDrawer: () => scaffold_Key.currentState.openDrawer(),
          ),
          drawer: DrawerView(),
          body: Form(
            key: form_Key,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  //=========== Logo Location ==========
                  Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                      bottom: 10,
                      right: MediaQuery.of(context).size.width / 4,
                      left: MediaQuery.of(context).size.width / 4,
                    ),
                    child: AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: AppLogo(),
                    ),
                  ),

                  // ============ user name ============
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 0.0,
                    virticaloffset: 50.0,
                    widget: CustomTextField(
                      horizontalPadding: 10,
                      labelSize: 12,
                      leftPadding: 5,
                      rightPadding: 5,
                      secureText: false,
                      label: translator.translate("user_name"),
                      inputType: TextInputType.name,
                      prefixIcon: Container(
                        height: 25,
                        width: 25,
                        child: Center(
                          child: Image.asset(
                            'assets/images/icons/user.png',
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: Color(0xffC8C8C8),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ============ email ============
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 0.0,
                    virticaloffset: 50.0,
                    widget: CustomTextField(
                      horizontalPadding: 10,
                      labelSize: 12,
                      leftPadding: 5,
                      rightPadding: 5,
                      secureText: false,
                      label: translator.translate("email"),
                      inputType: TextInputType.emailAddress,
                      prefixIcon: customImageContainer(imgSrc: 'assets/images/icons/mail.png'),
                    ),
                  ),

                  // ============ message ============
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 0.0,
                    virticaloffset: 50.0,
                    widget: CustomTextField(
                      horizontalPadding: 10,
                      labelSize: 12,
                      leftPadding: 5,
                      rightPadding: 5,
                      lines: 3,
                      secureText: false,
                      label: translator.translate("your_message"),
                      inputType: TextInputType.text,
                      prefixIcon: Container(
                        height: 25,
                        width: 25,
                        child: Center(
                          child: Image.asset(
                            'assets/images/icons/editeinfo.png',
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: Color(0xffC8C8C8),
                          ),
                        ),
                      ),
                    ),
                  ),

                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 0.0,
                    virticaloffset: 50.0,
                    widget: InkWell(
                      onTap: () {},
                      child: CustomButton(
                        text: translator.translate("sent_message"),
                        color: Color(lightThemeColors["secondary"]),
                        height: 45,
                        width: double.infinity,
                        rightPadding: 15,
                        leftPadding: 15,
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height / 10),

                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 50.0,
                    virticaloffset: 0.0,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customSocialIcon(
                            imgSrc: 'assets/images/icons/facebook.png'),
                        customSocialIcon(
                            imgSrc: 'assets/images/icons/twitter.png'),
                        customSocialIcon(
                            imgSrc: 'assets/images/icons/instagram.png'),
                        customSocialIcon(
                            imgSrc: 'assets/images/icons/youtube.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget customSocialIcon({
  String imgSrc,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Image.asset(
      imgSrc,
      height: 45,
      width: 45,
      fit: BoxFit.cover,
    ),
  );
}
