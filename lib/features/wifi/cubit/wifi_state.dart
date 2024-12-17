part of 'wifi_cubit.dart';

abstract class WifiState extends Equatable {
  const WifiState();

  @override
  List<Object?> get props => [];
}

class WifiInitial extends WifiState {}

class WifiLoading extends WifiState {}

class WifiLoaded extends WifiState {
  final List<Network> networks;
  final List<Network> previousNetworks;

  const WifiLoaded({required this.networks, required this.previousNetworks});

  @override
  List<Object?> get props => [networks, previousNetworks];
}

class WifiError extends WifiState {
  final String message;

  const WifiError(this.message);

  @override
  List<Object?> get props => [message];
}
