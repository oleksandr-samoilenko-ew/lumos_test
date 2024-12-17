import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/assets/assets.dart';
import '../../../common/colors/colors.dart';
import '../cubit/wifi_cubit.dart';
import '../widgets/wifi_network_list.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({super.key});

  @override
  WifiScreenState createState() => WifiScreenState();
}

class WifiScreenState extends State<WifiScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WifiCubit>().loadWifiNetworks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lumos')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Center(
              child: constraints.maxWidth > 600 ? _buildLandscapeLayout(constraints) : _buildPortraitLayout(constraints),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLandscapeLayout(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogo(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: regularGreyColor,
                  width: 2,
                ),
              ),
            ),
            height: constraints.maxHeight / 2.5,
            child: const Padding(
              padding: EdgeInsets.only(left: 60),
              child: WifiNetworkList(crossAxisAlignment: CrossAxisAlignment.start),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPortraitLayout(BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogo(),
        SizedBox(height: constraints.maxHeight * 0.05),
        Expanded(
          child: SizedBox(
            height: constraints.maxHeight / 5,
            child: const Center(
              child: WifiNetworkList(
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Image.asset(
        Assets.logo,
      ),
    );
  }
}
