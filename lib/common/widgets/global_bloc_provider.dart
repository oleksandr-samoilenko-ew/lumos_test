import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumos/features/wifi/repositories/wifi_repository.dart';

import '../../features/wifi/bloc/wifi_bloc.dart';

class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WifiBloc>(
          create: (context) => WifiBloc(wifiRepository: context.read<WifiRepository>()),
        ),
      ],
      child: child,
    );
  }
}
