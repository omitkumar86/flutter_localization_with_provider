import 'package:flutter/material.dart';
import 'package:flutter_localization_with_provider/localization/app_localization.dart';
import 'package:flutter_localization_with_provider/provider/locale_provider.dart';
import 'package:flutter_localization_with_provider/view/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LocaleProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer<LocaleProvider>(
            builder: (BuildContext context, localeProvider, Widget? child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Localization App',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                locale: localeProvider.locale,
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('bn', ''),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: HomePage(),
              );
            },
          );
        });
  }
}
