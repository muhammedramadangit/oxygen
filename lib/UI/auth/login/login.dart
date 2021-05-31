import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomBottonFrame.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/CustomSkipButton.dart';
import 'package:oxygen/UI/common/RememberMeButton.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/theme/color.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> form_Key = GlobalKey<FormState>();
  final String language = translator.currentLanguage;
  bool _obSecure = true;
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: form_Key,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    // the logo position
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 100.0,
                      widget: AppLogo(),
                    ),

                    SizedBox(height: 10),

                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 100.0,
                      widget: Text(
                        translator.translate("log_in"),
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
                      virticaloffset: 100.0,
                      widget: Text(
                        translator.translate("oxygen_slogan"),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(lightThemeColors["text-body"]),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

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
                          imgSrc: 'assets/images/icons/mail.png',
                        ),
                        /* onChanged: (String value) {
                                  print(value);
                                  logInBloc.updateMail(value);
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

                    SizedBox(height: 0),

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
                        /* onChanged: (String value) {
                                  print(value);
                                  logInBloc.updateMail(value);
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
                    AnimatedWidgets(
                      duration: 1.5,
                      virticaloffset: 0.0,
                      horizontalOffset: 150.0,
                      widget: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomCheckBox(isChecked: true),
                                SizedBox(width: 10),
                                Text(
                                  translator.translate("remember_me"),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'JannaLT-Bold',
                                    color: Color(lightThemeColors['primary']),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () =>
                                  navigator.push(Routes.RESET_PASSWORD),
                              child: Text(
                                translator.translate("forget_password"),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'JannaLT-Bold',
                                  color: Color(lightThemeColors['primary']),
                                ),
                              ),
                            )
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
                          logInBloc.add(Click()); */
                        },
                        child: CustomButton(
                          text: translator.translate("log_in"),
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
                        translator.translate("don't_have_account"),
                        style: TextStyle(
                          fontSize: 15,
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
                          navigator.push(Routes.SIGNUP_ROUTER);
                          /* if (!form_key.currentState.validate()) {
                            return;
                          }
                          logInBloc.add(Click()); */
                        },
                        child: CustomButtonFrame(
                          text: translator.translate("new_account"),
                          color: Colors.white,
                          height: 45,
                          width: double.infinity,
                          rightPadding: 15,
                          leftPadding: 15,
                        ),
                      ),
                    ),

                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: InkWell(
                        onTap: () {
                          navigator.push(Routes.MAIN_PAGE);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomSkipBottom(),
                            Text(
                              translator.translate("visitor"),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'JannaLT-Bold',
                                color: Color(lightThemeColors['secondary']),
                              ),
                            ),
                          ],
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
