import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomBottomSheet.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/CustomSkipButton.dart';
import 'package:oxygen/UI/common/RememberMeButton.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/theme/color.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> form_Key = GlobalKey<FormState>();
  final String language = translator.currentLanguage;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();
  String _selecedItem;
  bool _obSecure = true;

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
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: form_Key,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(bottom: 15),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.topRight,
                        child: CustomSkipBottom(
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    // the logo position
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: AppLogo(),
                    ),

                    SizedBox(height: 10),

                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Text(
                        translator.translate("new_account"),
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'JannaLT-Bold',
                          color: Color(lightThemeColors['text-head']),
                        ),
                      ),
                    ),

                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Text(
                        translator.translate("oxygen_slogan"),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(lightThemeColors["text-body"]),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

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
                        prefixIcon: customImageContainer(
                            imgSrc: 'assets/images/icons/mail.png'),
                        /* onChanged: (String value) {
                                  print(value);
                                  SignUpBloc.updateMail(value);
                                },
                                // ignore: missing_return
                                validate: (String value) {
                                  if (value == null ||
                                      !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(value)) {
                                    return translator.translate("email_validation");
                                  }
                                }, */
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
                        prefixIcon: customImageContainer(
                          imgSrc: 'assets/images/icons/phone.png',
                        ),
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
                                widget: customImageContainer(
                                  imgSrc: 'assets/images/icons/down.png',
                                ),
                                ontap: () {
                                  _cityBottomSheet();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ============ password ============
                    AnimatedWidgets(
                      duration: 1.5,
                      virticaloffset: 0.0,
                      horizontalOffset: 150.0,
                      widget: CustomTextField(
                        horizontalPadding: 10,
                        labelSize: 12,
                        leftPadding: 5,
                        rightPadding: 5,
                        secureText: _obSecure,
                        label: translator.translate("password"),
                        prefixIcon: customImageContainer(
                          imgSrc: 'assets/images/icons/wpass.png',
                        ),
                        suffixIcon: CustomIconTap(
                          widget: _obSecure == true
                              ? customImageContainer(
                                  imgSrc: 'assets/images/icons/wshow.png',
                                )
                              : customImageContainer(
                                  imgSrc: 'assets/images/icons/show.png',
                                ),
                          ontap: () {
                            setState(() {
                              _obSecure = !_obSecure;
                            });
                          },
                        ),
                      ),
                    ),

                    // ============ confirm password ============
                    AnimatedWidgets(
                      duration: 1.5,
                      virticaloffset: 0.0,
                      horizontalOffset: 150.0,
                      widget: CustomTextField(
                        horizontalPadding: 10,
                        labelSize: 12,
                        leftPadding: 5,
                        rightPadding: 5,
                        secureText: _obSecure,
                        label: translator.translate("password_confirmation"),
                        prefixIcon: customImageContainer(
                          imgSrc: 'assets/images/icons/wpass.png',
                        ),
                        suffixIcon: CustomIconTap(
                          widget: _obSecure == true
                              ? customImageContainer(
                                  imgSrc: 'assets/images/icons/wshow.png',
                                )
                              : customImageContainer(
                                  imgSrc: 'assets/images/icons/show.png',
                                ),
                          ontap: () {
                            setState(() {
                              _obSecure = !_obSecure;
                            });
                          },
                        ),
                      ),
                    ),

                    AnimatedWidgets(
                      duration: 1.5,
                      horizontalOffset: 0.0,
                      virticaloffset: 150.0,
                      widget: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomCheckBox(isChecked: true),
                            SizedBox(width: 10),
                            Text(
                              translator.translate("agree_to"),
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(lightThemeColors['text-head']),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                translator.translate("terms_and_conditions"),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'JannaLT-Bold',
                                  color: Color(lightThemeColors['primary']),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: InkWell(
                        onTap: () {
                          /* if (!form_key.currentState.validate()) {
                            return;
                          }
                          SignUpBloc.add(Click()); */
                        },
                        child: CustomButton(
                          text: translator.translate("create_account"),
                          color: Color(lightThemeColors["secondary"]),
                          height: 45,
                          width: double.infinity,
                          rightPadding: 15,
                          leftPadding: 15,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Text(
                        translator.translate("have_account"),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(lightThemeColors['text-head']),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: InkWell(
                        onTap: () {
                          navigator.push(Routes.LOG_IN);
                          /* if (!form_key.currentState.validate()) {
                            return;
                          }
                          SignUpBloc.add(Click()); */
                        },
                        child: CustomButtonFrame(
                          text: translator.translate("log_in"),
                          color: Colors.white,
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
      ),
    );
  }
}
