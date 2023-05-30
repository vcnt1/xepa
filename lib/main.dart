import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:xepa/app/config/config.dart';
import 'app/feature/navigation/ui/outter_page.dart';

import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: MyColors.primaryColor,
      systemNavigationBarColor: MyColors.grey1,
    ),
  );

  // final Widget myApp = Device.currentBuildMode() == BuildMode.profile
  //     ? DevicePreview(
  //         builder: (_) => MyApp(),
  //       )
  //     : MyApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Xepa',
        debugShowCheckedModeBanner: false,
        // supportedLocales: const [
        //   Locale('pt', 'BR'),
        // ],
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        theme: MyTheme.light,
        // builder: Device.currentBuildMode() == BuildMode.profile ? DevicePreview.appBuilder : null,
        // locale: Device.currentBuildMode() == BuildMode.profile ? DevicePreview.locale(context) : null,
        home: SafeArea(
          child: OutterPage(),
        ),
      );
}
