import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/auth/new_Password/new_password.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/CustomSkipButton.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/UI/common/Timer_Cont_Down.dart';

class ResetPasswordCode extends StatefulWidget {
  @override
  _ResetPasswordCodeState createState() => _ResetPasswordCodeState();
}

class _ResetPasswordCodeState extends State<ResetPasswordCode> {
  GlobalKey<FormState> form_Key = GlobalKey<FormState>();
  final String language = translator.currentLanguage;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.topRight,
                      child: CustomSkipBottom(
                        onTap: () => Navigator.pop(context),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height / 12),

                    // the logo position
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: AppLogo(),
                    ),

                    SizedBox(height: 25),
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Text(
                        translator.translate("استرجاع كلمة المرور"),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(lightThemeColors['text-head']),
                        ),
                      ),
                    ),

                    SizedBox(height: 7),
                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: Text(
                        translator.translate(
                            "ادخل الكود المرسل على بريدك الالكترونى \n لاسنرجاع كلمة المرور"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 14,
                          color: Color(lightThemeColors["text-body"]),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    // ============ Confirm Code ============
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
                        label: translator.translate("ادخل الكود"),
                        prefixIcon: Icon(Icons.edit),
                        /* onChanged: (String value) {
                                        print(value);
                                        ResetPasswordCodeBloc.updateMail(value);
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

                    SizedBox(height: 10),

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
                            //========= Timer Count Down ==============
                            TimerCountDown(),

                            
                            //========= لم يصلنى اعد الارسال ==============
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  translator.translate("لم يصلني ؟ "),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(lightThemeColors['text-head']),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    translator.translate("أعد الإرسال"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(lightThemeColors['primary']),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => NewPassword()));
                          /* if (!form_key.currentState.validate()) {
                                  return;
                                }
                                ResetPasswordCodeBloc.add(Click()); */
                        },
                        child: CustomButton(
                          text: translator.translate("استرجاع كلمة المرور"),
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
      ),
    );
  }
}
