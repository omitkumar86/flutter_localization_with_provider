
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../utils/app_color.dart';


class MyDrawerPage extends StatefulWidget {
  static const String routeName = '/my_drawer';
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Drawer(
        width: 233.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Change Theme", style: TextStyle(fontSize: 22.sp, color: AppColor.greenColor, fontWeight: FontWeight.w500),),
                FlutterSwitch(
                  activeText: "Light",
                  inactiveText: "Dark",
                  activeTextColor: AppColor.primaryWhite,
                  inactiveTextColor: AppColor.primaryWhite,
                  activeColor: AppColor.primaryOrange,
                  inactiveColor: AppColor.primaryOrange,
                  valueFontSize: 14.0.sp,
                  toggleSize: 25.0.sp,
                  value: themeProvider.themeData?.brightness == Brightness.dark,
                  borderRadius: 40.0.r,
                  padding: 5,
                  showOnOff: true,
                  inactiveIcon: Icon(Icons.light_mode, color: AppColor.primaryBlack,),
                  activeIcon: Icon(Icons.dark_mode, color: AppColor.primaryBlack,),
                  onToggle: (_) {
                   themeProvider.toggleTheme();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
