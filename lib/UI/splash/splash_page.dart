import 'dart:async';

//import 'package:oxygen/app/appEvent.dart';
//import 'package:oxygen/app/appState.dart';
//import 'package:oxygen/ui/splash/splash_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/UI/common/AppLogo.dart';
import 'package:oxygen/UI/common/AnimatedWidget.dart';
import 'package:oxygen/theme/color.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //SplashBloc splashBloc = SplashBloc();
  NamedNavigatorImpl navigator = NamedNavigatorImpl();

  @override
  void initState() {
    Timer(Duration(seconds: 5), () => navigator.push(Routes.LOG_IN));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BlocListener<SplashBloc, AppState>(
      //  bloc: splashBloc,
      //  listener: (context, state) {},
      //  child: BlocBuilder<SplashBloc, AppState>(
      //    bloc: splashBloc,
      //    builder: (context, state) {
      //      return
      //    },
      //  ),
      //),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/images/oxy.png',
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(lightThemeColors['secondary']),
                Color(lightThemeColors['secondary']),
                Color(lightThemeColors['secondary']),
                Color(lightThemeColors['secondary']).withOpacity(0.9),
                Color(lightThemeColors['secondary']).withOpacity(0.7),
              ], begin: Alignment.topCenter, end: Alignment.bottomRight),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedWidgets(
              duration: 1,
              horizontalOffset: 0,
              virticaloffset: 150,
              widget: AppLogo(),
            ),
          )
        ],
      ),
    );
  }
}
