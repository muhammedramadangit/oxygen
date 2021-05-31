import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/theme/color.dart';
import 'package:oxygen/ui/common/AnimatedWidget.dart';
import 'package:flutter/material.dart';

/*class ProfileItem extends StatelessWidget {
  final String label ;
  final String routeName ;
  final Function onTab ;

  const ProfileItem({Key key, this.label, this.routeName, this.onTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      AnimatedWidgets(
        duration: 1.5,
        horizontalOffset: 150.0,
        virticaloffset: 0.0,
        widget:Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label),
                  Icon(Icons.arrow_right),
                  //Image.asset("assets/images/arrowright.png",height: 15,width: 15,)
                ],
              ),
            ),
            Divider()
          ],
        ));

  }
}
 */


Widget profileItem({
  Function onTap,
  String title_Key,
  Widget trailing,
  Widget leading,
}) {
  return AnimatedWidgets(
    duration: 1.5,
    horizontalOffset: 0,
    virticaloffset: 50,
    widget: ListTile(
      onTap: onTap,
      title: Text(
        translator.translate(title_Key),
        style: TextStyle(
          color: Color(lightThemeColors['text-head']),
          fontSize: 14,
          //fontFamily: 'JannaLT-Bold',
          //fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      leading: leading,
    ),
  );
}

Widget profileCustomDivider() {
  return AnimatedWidgets(
    duration: 1.5,
    horizontalOffset: 0,
    virticaloffset: 50,
    widget: Divider(
      color: Color(lightThemeColors['text-body']),
      endIndent: 15,
      indent: 15,
      height: 0,
    ),
  );
}