import 'package:get_it/get_it.dart';

import '../features/wifi/services/data_service.dart';

final GetIt locator = GetIt.asNewInstance();

Future<void> injectDependencies() async {
  GetIt.I.registerLazySingleton<DataService>(() => DataService());
}
