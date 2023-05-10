
import 'package:flutter/material.dart';
import 'package:flutter_localization_with_provider/localization/app_localization.dart';
import 'package:flutter_localization_with_provider/utils/app_color.dart';
import 'package:flutter_localization_with_provider/view/my_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../provider/locale_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final localeProvider = Provider.of<LocaleProvider>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Consumer<LocaleProvider>(
      builder: (BuildContext context, localeProvider, Widget? child) {
        return Scaffold(
          drawer: MyDrawerPage(),
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.appBarColor,
            title: Text(AppLocalizations.of(context)!.title.toString()),
            leading: InkWell(
                onTap: (){
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu, size: 16.5.sp, color: AppColor.primaryWhite,)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.greeting.toString(),
                  style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600, color: AppColor.primaryOrange),
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
                      style: TextStyle(fontSize: 22.sp, color: AppColor.greenColor, fontWeight: FontWeight.w500),),
                    FlutterSwitch(
                      activeText: "EN",
                      inactiveText: "BN",
                      activeTextColor: AppColor.primaryWhite,
                      inactiveTextColor: AppColor.primaryWhite,
                      activeColor: AppColor.primaryOrange,
                      inactiveColor: AppColor.primaryOrange,
                      valueFontSize: 14.0.sp,
                      toggleSize: 25.0.sp,
                      value: localeProvider.locale.languageCode == 'bn',
                      borderRadius: 40.0.r,
                      padding: 5,
                      showOnOff: true,
                      onToggle: (value) {
                        final newLocale = value ? const Locale('bn') : const Locale('en');
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