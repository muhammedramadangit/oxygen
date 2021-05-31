import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/UI/common/Custom_dialog.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';

class EditMyAccount extends StatefulWidget {
  @override
  _EditMyAccountState createState() => _EditMyAccountState();
}

class _EditMyAccountState extends State<EditMyAccount> {
  final String language = translator.currentLanguage;
  String _selecedItem;
  TextEditingController userNameController,
      mailController,
      phoneController,
      cityController;

  void _cityBottomSheet() {
    CustomSheet(
      context: context,
      widget: Directionality(
        textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  translator.translate('choose_ur_city'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'JannaLT-Bold',
                    color: Color(lightThemeColors['text-head']),
                  ),
                ),
                ListTile(
                  title: Text(
                    'الرياض',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(lightThemeColors['text-head'])),
                  ),
                  onTap: () => _selectItem('الرياض'),
                ),
                ListTile(
                  title: Text(
                    'مكة المكرمة',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(lightThemeColors['text-head'])),
                  ),
                  onTap: () => _selectItem('مكة المكرمة'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selecedItem = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'edit_my_account',
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //============= change photo ============
                  AnimatedWidgets(
                    duration: 1.5,
                    virticaloffset: 50.0,
                    horizontalOffset: 0.0,
                    widget: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage('assets/images/profile.jpg'),
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    'assets/images/icons/changepic.png',
                                    width: 55,
                                    height: 45,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ============ user name ============
                  AnimatedWidgets(
                    duration: 1.5,
                    virticaloffset: 0.0,
                    horizontalOffset: 150.0,
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
                    virticaloffset: 0.0,
                    horizontalOffset: 150.0,
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

                  // ============ phone number ============
                  AnimatedWidgets(
                    duration: 1.5,
                    virticaloffset: 0.0,
                    horizontalOffset: 150.0,
                    widget: CustomTextField(
                      horizontalPadding: 10,
                      labelSize: 12,
                      leftPadding: 5,
                      rightPadding: 5,
                      secureText: false,
                      label: translator.translate("phone"),
                      inputType: TextInputType.number,
                      prefixIcon: customImageContainer(imgSrc: 'assets/images/icons/phone.png'),
                    ),
                  ),

                  // ============ city ============
                  AnimatedWidgets(
                    duration: 1.5,
                    virticaloffset: 0.0,
                    horizontalOffset: 150.0,
                    widget: InkWell(
                      onTap: () {
                        _cityBottomSheet();
                      },
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 2.0, bottom: 2.0),
                        padding: EdgeInsets.only(
                            right: 12.0, top: 10.0, bottom: 10.0, left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[50],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Image.asset(
                                      'assets/images/icons/city.png'),
                                ),
                                Text(
                                  translator.translate(_selecedItem != null
                                      ? _selecedItem
                                      : 'city'),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: _selecedItem != null
                                        ? Color(lightThemeColors['primary'])
                                        : Color(0xffC8C8C8),
                                  ),
                                )
                              ],
                            ),
                            CustomIconTap(
                              widget:
                                  customImageContainer(imgSrc: 'assets/images/icons/down.png'),
                              ontap: () {
                                _cityBottomSheet();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  AnimatedWidgets(
                    duration: 1.5,
                    horizontalOffset: 0.0,
                    virticaloffset: 50.0,
                    widget: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              message: 'save_changes',
                              navRoute: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      child: CustomButton(
                        text: translator.translate("save"),
                        color: Color(lightThemeColors["secondary"]),
                        height: 45,
                        width: double.infinity,
                        rightPadding: 15,
                        leftPadding: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
