import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/UI/our_bank_accounts/Our_bank_accounts_item.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/UI/common/CustomAppBar.dart';

class OurBankAccounts extends StatefulWidget {
  @override
  _OurBankAccountsState createState() => _OurBankAccountsState();
}

class _OurBankAccountsState extends State<OurBankAccounts> {
  final String language = translator.currentLanguage;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: language == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          appBarTilteKey: translator.translate('our_bank_accounts'),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (_, index) {
            return AnimatedWidgets(
              duration: 1.5,
              horizontalOffset: 50,
              virticaloffset: 0,
              widget: OurBankAccountsItem(
                bankName: "Al_Rajhi_Bank",
                accountHoner: "مؤسسة نقاء زائد للعدسات الطبية",
                accountNumber: "4454777879777891",
                aibanNumber: "SA 4487979711069",
              ),
            );
          },
        ),
      ),
    );
  }
}
