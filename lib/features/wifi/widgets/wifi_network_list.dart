import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/colors/colors.dart';
import '../cubit/wifi_cubit.dart';
import '../services/models/network.dart';
import '../widgets/animated_list_item.dart';

class WifiNetworkList extends StatefulWidget {
  final CrossAxisAlignment crossAxisAlignment;

  const WifiNetworkList({super.key, required this.crossAxisAlignment});

  @override
  WifiNetworkListState createState() => WifiNetworkListState();
}

class WifiNetworkListState extends State<WifiNetworkList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        _buildTitle(context),
        const SizedBox(height: 30),
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
                WifiLoaded(networks: final networks) => AnimatedList(
                    key: _listKey,
                    initialItemCount: networks.length,
                    itemBuilder: (context, index, animation) {
                      return AnimatedListItem(network: networks[index], animation: animation);
                    },
                  ),
                WifiError(message: final message) => Text('Error: $message'),
                _ => const Text('Press the refresh button to load networks'),
              };
            },
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () => context.read<WifiCubit>().shuffleNetworks(),
          style: ElevatedButton.styleFrom(backgroundColor: primaryButtonColor, foregroundColor: Colors.white),
          label: const Text('Neu Laden'),
          icon: const Icon(Icons.refresh),
        ),
      ],
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
        const SizedBox(height: 10),
        Text(
          'Lass uns beginnen indem wir uns mit einem WLAN verbinden.',
          style: GoogleFonts.lato().copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  void _animateListChanges(List<Network> oldList, List<Network> newList) {
    for (int oldIndex = 0; oldIndex < oldList.length; oldIndex++) {
      final newIndex = newList.indexWhere((network) => network.name == oldList[oldIndex].name);
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
