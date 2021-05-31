import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxygen/navigator/named-navigator.dart';
import 'package:oxygen/navigator/named-navigator_impl.dart';
import 'package:oxygen/theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeDefault: LocalizationDefaultType.asDefined,
    languagesList: <String>['ar', 'en-gb'],
    assetsDirectory: 'assets/langs/',
  );
  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: navKey,
      title: 'Oxygen',
      initialRoute: Routes.SPLASH_ROUTER,
      onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
      navigatorKey: NamedNavigatorImpl.navigatorState,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: translator.locale,
      supportedLocales: [
        const Locale('en', 'gb'),
        const Locale('ar', ''),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:
            AppBarTheme(actionsIconTheme: IconThemeData(color: Colors.white), elevation: 0, color: Colors.white, iconTheme: IconThemeData(color: Colors.white)),
        primaryColorBrightness: Brightness.light,
        brightness: Brightness.light,
        primaryColor: Color(lightThemeColors['primary']),
        accentColor: Color(lightThemeColors['secondary']),
        backgroundColor: Color(0xFFF4FAFD),
        fontFamily: "JannaLT-Regular",
        hintColor: Color(lightThemeColors['text-body']),
        primarySwatch: Colors.blue,
      ),
    );
  }
}

