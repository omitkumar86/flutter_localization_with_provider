
import 'package:flutter_localization_with_provider/provider/locale_provider.dart';
import 'package:flutter_localization_with_provider/provider/theme_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// Core
//   sl.registerLazySingleton(() => NetworkInfo(sl()));
     //sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
     //sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  /// Provider
     sl.registerFactory(() => ThemeProvider());
     sl.registerFactory(() => LocaleProvider());

  /// External
      final sharedPreferences = await SharedPreferences.getInstance();
      sl.registerLazySingleton(() => sharedPreferences);

}