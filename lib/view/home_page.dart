import 'package:flutter/material.dart';
import 'package:flutter_localization_with_provider/localization/app_localization.dart';
import 'package:provider/provider.dart';
import '../provider/locale_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.greeting.toString(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newLocale = localeProvider.locale.languageCode == 'en'
                    ? Locale('bn')
                    : Locale('en');
                localeProvider.setLocale(newLocale);
              },
              child: Text(AppLocalizations.of(context)!.switchButton.toString()),
            ),
          ],
        ),
      ),
    );
  }
}