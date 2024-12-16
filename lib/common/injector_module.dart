import 'package:get_it/get_it.dart';


import '../features/wifi/services/data_service.dart';

class InjectorModule {
  static GetIt locator = GetIt.asNewInstance();

  static Future<void> inject() async {
    GetIt.I.registerLazySingleton<DataService>(() => DataService());
  }
}
