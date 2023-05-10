import 'package:flutter/material.dart';
import 'package:flutter_localization_with_provider/localization/app_localization.dart';
import 'package:flutter_localization_with_provider/provider/locale_provider.dart';
import 'package:flutter_localization_with_provider/provider/theme_provider.dart';
import 'package:flutter_localization_with_provider/view/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => di.sl<LocaleProvider>()),
    ChangeNotifierProvider(create: (_) => di.sl<ThemeProvider>()),
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
          return FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                return Consumer2<LocaleProvider, ThemeProvider>(
                  builder: (BuildContext context, localeProvider, themeProvider,
                      Widget? child) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Localization App',
                      theme: themeProvider.themeData,
                      locale: localeProvider.locale,
                      supportedLocales: const [
                        Locale('en', 'US'),
                        Locale('bn', 'BD'),
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
        });
  }
}
