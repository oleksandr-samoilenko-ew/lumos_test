
import '../services/data_service.dart';
import '../services/models/network.dart';

abstract class WifiRepository {
  final DataService dataService;

  WifiRepository(this.dataService);

  Future<List<Network>> fetchNetworks();
}

class WifiRepositoryImpl implements WifiRepository {
  @override
  final DataService dataService;

  WifiRepositoryImpl({required this.dataService});

  @override
  Future<List<Network>> fetchNetworks() async {
    return await dataService.fetchNetworks();
  }
}
