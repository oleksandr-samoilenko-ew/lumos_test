import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/assets/assets.dart';
import '../../../common/colors/colors.dart';
import '../cubit/wifi_cubit.dart';
import '../services/models/network.dart';
import '../widgets/animated_list_item.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({super.key});

  @override
  WifiScreenState createState() => WifiScreenState();
}

class WifiScreenState extends State<WifiScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WifiCubit>().loadWifiNetworks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lumos')),
      body:
          //  LayoutBuilder(builder: builder)

          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(context),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: BlocConsumer<WifiCubit, WifiState>(
                            listener: (context, state) {
                              if (state is WifiLoaded && state.previousNetworks.isNotEmpty) {
                                _animateListChanges(state.previousNetworks, state.networks);
                              }
                            },
                            builder: (context, state) {
                              return switch (state) {
                                WifiLoading() => const CircularProgressIndicator(),
                                WifiLoaded(networks: var networks) => AnimatedList(
                                    key: _listKey,
                                    initialItemCount: networks.length,
                                    itemBuilder: (context, index, animation) {
                                      return AnimatedListItem(network: networks[index], animation: animation);
                                    },
                                  ),
                                WifiError(message: var message) => Text('Error: $message'),
                                _ => const Text('Press the refresh button to load networks'),
                              };
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: () => context.read<WifiCubit>().shuffleNetworks(),
                          style: ElevatedButton.styleFrom(backgroundColor: primaryButtonColor, foregroundColor: Colors.white),
                          label: const Text('Neu Laden'),
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Willkomen!',
          style: GoogleFonts.lato().copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Lass uns beginnen indem wir uns mit einem WLAN verbinden.',
          style: GoogleFonts.lato().copyWith(fontSize: 16, fontWeight: FontWeight.w400),
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

  void _animateListChanges(List<Network> oldList, List<Network> newList) {
    for (int oldIndex = 0; oldIndex < oldList.length; oldIndex++) {
      int newIndex = newList.indexWhere((network) => network.name == oldList[oldIndex].name);
      if (oldIndex != newIndex) {
        _listKey.currentState?.removeItem(
          oldIndex,
          (context, animation) => AnimatedListItem(network: oldList[oldIndex], animation: animation),
          duration: const Duration(milliseconds: 500),
        );
        _listKey.currentState?.insertItem(
          newIndex,
          duration: const Duration(milliseconds: 500),
        );
      }
    }
  }
}
