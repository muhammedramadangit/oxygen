import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/theme/color.dart';

class OurBankAccountsItem extends StatelessWidget {
  final String bankName, accountHoner, accountNumber, aibanNumber;

  const OurBankAccountsItem({this.bankName, this.accountHoner, this.accountNumber, this.aibanNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Image.asset(
                  'assets/images/raghi.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.cover,
                )),
              ),
              
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translator.translate(bankName),
                        style: TextStyle(
                          color: Color(lightThemeColors['text-head']),
                          fontSize: 15,
                          fontFamily: 'JannaLT-Bold',
                        ),
                      ),
                      customShadowTitle(
                        context: context,
                        title: 'اسم صاحب الحساب'
                      ),
                      Text(
                        translator.translate(accountHoner),
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),

                      
                      customShadowTitle(
                        context: context,
                        title: 'رقم الحساب'
                      ),
                      Text(
                        accountNumber,
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),

                      customShadowTitle(
                        context: context,
                        title: 'رقم الأيبان'
                      ),
                      Text(
                        aibanNumber,
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}

Widget customShadowTitle({BuildContext context, String title}) {
  return Container(
    height: 30,
    width: MediaQuery.of(context).size.width / 3.2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(
        colors: [
          Theme.of(context).primaryColor.withOpacity(0.3),
          Theme.of(context).primaryColor.withOpacity(0.2),
          Theme.of(context).primaryColor.withOpacity(0.1),
          Theme.of(context).primaryColor.withOpacity(0.05),
          Theme.of(context).primaryColor.withOpacity(0.025),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ),
    child: Center(
      child: Text(
        translator.translate(title),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 12,
        ),
      ),
    ),
  );
}
