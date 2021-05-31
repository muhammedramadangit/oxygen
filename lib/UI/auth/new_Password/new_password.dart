import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/CustomSkipButton.dart';
import 'package:oxygen/UI/common/Custom_dialog.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/theme/color.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  GlobalKey<FormState> form_Key = GlobalKey<FormState>();
  final String language = translator.currentLanguage;
  bool _obSecure = true;

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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.topRight,
                      child: CustomSkipBottom(
                        onTap: () => Navigator.pop(context),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height/12),

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
                            "ادخل كلمة المرور الجديدة للدخول الى \n حسابك"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 2,
                          fontSize: 14,
                          color: Color(lightThemeColors["text-body"]),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

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
                        label: translator.translate("كلمة المرور"),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: CustomIconTap(
                          widget: _obSecure == true
                              ? Image.asset('assets/images/icons/wshow.png')
                              : Image.asset('assets/images/icons/show.png'),
                          ontap: (){
                            setState(() {
                              _obSecure = !_obSecure;
                            });
                          },
                        ),
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
                        label: translator.translate("تأكيد كلمة المرور"),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: CustomIconTap(
                          widget: _obSecure == true
                              ? Image.asset('assets/images/icons/wshow.png')
                              : Image.asset('assets/images/icons/show.png'),
                          ontap: (){
                            setState(() {
                              _obSecure = !_obSecure;
                            });
                          },
                        ),
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

                    AnimatedWidgets(
                      duration: 2,
                      horizontalOffset: 0.0,
                      virticaloffset: 50.0,
                      widget: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog(message: 'تم إسترجاع كلمة المرور بنجاح',);
                              });
                          /* if (!form_key.currentState.validate()) {
                              return;
                            }
                            NewPasswordBloc.add(Click()); */
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
