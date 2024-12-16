import '../../../common/services/data_service.dart';

abstract class WifiRepository {
  final DataService dataService;

  WifiRepository(this.dataService);

  Future<Object> fetchImageDescription();
}

class WifiRepositoryImpl implements WifiRepository {
  @override
  final DataService dataService;

  WifiRepositoryImpl({required this.dataService});

  @override
  Future<Object> fetchImageDescription() async {
    return await dataService.fetchNetworks();
  }
}
