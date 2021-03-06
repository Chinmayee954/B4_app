import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_project/userpage.dart';
import 'package:x509/x509.dart';
import "package:pointycastle/export.dart";
import 'package:asn1lib/asn1lib.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static final String title = 'Secure Storage';





  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: Colors.blueAccent,
      accentColor: Colors.white38,
      unselectedWidgetColor: Colors.white12,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    home: UserPage(),
  );
}