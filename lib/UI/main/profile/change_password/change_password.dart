import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';
import 'package:oxygen/UI/common/CustomButton.dart';
import 'package:oxygen/UI/common/CustomTextField.dart';
import 'package:oxygen/UI/common/Custom_Icon_Tap.dart';
import 'package:oxygen/UI/common/Custom_dialog.dart';
import 'package:oxygen/UI/common/customImageContainer.dart';
import 'package:oxygen/theme/color.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final String language = translator.currentLanguage;
  bool _obSecure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: 'change_password',
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    // ============ old password ============
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
                        label: translator.translate("current_password"),
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

                    // ============ new password ============
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
                        label: translator.translate("new_password"),
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

                    // ============ Confirm new password ============
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
                        label: translator.translate("confirm_new_password"),
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedWidgets(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
