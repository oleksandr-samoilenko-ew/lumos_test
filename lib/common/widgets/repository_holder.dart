import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/wifi/repositories/wifi_repository.dart';
import '../../features/wifi/services/data_service.dart';

class RepositoriesHolder extends StatelessWidget {
  final Widget child;

  const RepositoriesHolder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final DataService dataService = GetIt.I<DataService>();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WifiRepository>(
          create: (context) => WifiRepositoryImpl(
            dataService: dataService,
          ),
        ),
      ],
      child: child,
    );
  }
}
