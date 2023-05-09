
import 'package:flutter/material.dart';
import 'package:flutter_localization_with_provider/localization/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../provider/locale_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final localeProvider = Provider.of<LocaleProvider>(context);

    return Consumer<LocaleProvider>(
      builder: (BuildContext context, localeProvider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.title.toString()),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.greeting.toString(),
                  style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600, color: Colors.orange),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.address.toString(),
                  style: TextStyle(fontSize: 23.sp),
                ),
                SizedBox(height: 30.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(AppLocalizations.of(context)!.switchButton.toString(),
                      style: TextStyle(fontSize: 22.sp, color: Colors.green, fontWeight: FontWeight.w500),),
                    FlutterSwitch(
                      activeText: "BN",
                      inactiveText: "EN",
                      activeTextColor: Colors.white,
                      inactiveTextColor: Colors.white,
                      activeColor: Colors.orange,
                      inactiveColor: Colors.orange,
                      valueFontSize: 16.0.sp,
                      toggleSize: 25.0.sp,
                      value: localeProvider.locale.languageCode == 'en',
                      borderRadius: 30.0.r,
                      padding: 5,
                      showOnOff: true,
                      onToggle: (value) {
                        final newLocale = value ? const Locale('en') : const Locale('bn');
                        localeProvider.setLocale(newLocale);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}