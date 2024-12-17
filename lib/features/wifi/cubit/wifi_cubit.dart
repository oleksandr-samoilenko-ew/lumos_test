import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/wifi_repository.dart';
import '../services/models/network.dart';

part 'wifi_state.dart';

class WifiCubit extends Cubit<WifiState> {
  final WifiRepository wifiRepository;

  WifiCubit({required this.wifiRepository}) : super(WifiInitial());

  Future<void> loadWifiNetworks() async {
    try {
      emit(WifiLoading());
      final networks = await wifiRepository.fetchNetworks();
      emit(WifiLoaded(networks: networks, previousNetworks: const []));
    } catch (e) {
      emit(WifiError('Failed to load WiFi networks: $e'));
    }
  }

  void shuffleNetworks() {
    if (state is WifiLoaded) {
      final currentState = state as WifiLoaded;
      final shuffledNetworks = List<Network>.from(currentState.networks)..shuffle();
      emit(WifiLoaded(networks: shuffledNetworks, previousNetworks: currentState.networks));
    }
  }
}
