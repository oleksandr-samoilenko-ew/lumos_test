import 'package:flutter/material.dart';

import 'common/widgets/global_bloc_provider.dart';
import 'features/wifi/screens/wifi_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocProvider(
      child: MaterialApp(
        title: 'Lumos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WifiScreen(),
      ),
    );
  }
}
